import os.path
import re
import sqlite3
import string
import numpy as np

import time

# DATA_PATH = "../dataset/maildir"
DATA_PATH = "../sub_dataset/maildir"
# invindex database
DB_INDEX_PATH = "../output/index.db"
# word index for semantic search
WORD_INDEX_PATH = "../output/word_index.npy"
# tfidf matrix for semantic search
TFIDF_MAT_PATH = "../output/tfidf_mat.npy"
STOPWORDS_PATH = "stopwords.txt"

# HELPER FUNCTIONS

# special pre_process for enron dataset
def pre_process_enron(file):
    """
    Args:
        file: opened file in lines

    Returns:
        A string with mail header removed
    """
    pre_processed_file = []
    useless_header = ['message-id:', 'sent:', 'date:', 'from:', 'to:', 'cc:', 'mime-version:', 'content-type:', 'content-transfer-encoding:', 'bcc:', 'x-from:', 'x-to:', 'x-cc:', 'x-bcc:', 'x-folder:', 'x-origin:', 'x-filename:']
    for line in file:
        line = line.lower() \
                .replace(':=', ': ') \
                .replace('>', ' ') \
                .split()
        while line and line[0] == '>':
            line.pop(0)

        if not line or line[0] in useless_header:
            # 空行或邮件头
            continue
        elif line[0] == 'subject:':
            line.pop(0)
        else:
            pass
        pre_processed_file.extend(line)
    return ' '.join(pre_processed_file)

def strip_punct(file):
    """remove punctuation & number
    """
    punctre = re.compile('[%s]' % re.escape(string.punctuation))
    nopunct = punctre.sub(' ',file)
    nopunct = re.sub('[0-9]+', ' ', nopunct)
    return nopunct

def stem_words(file, stem_mode=1):
    """词根化
    Args:
        file: string
        stem_mode: integer 0-2
    Returns:
        stemmed word in a list
    """
    stemmed_file = []
    if stem_mode == 0:
        from nltk.tokenize import word_tokenize
        from nltk.stem import PorterStemmer
        file = word_tokenize(text=file,language="english")
        for input_word in file:
            stemmed_file.append(PorterStemmer().stem(word=input_word))
    elif stem_mode == 1:
        from nltk.stem import SnowballStemmer
        snowball_stemmer = SnowballStemmer('english')
        file = file.split()
        for input_word in file:
            stemmed_file.append(snowball_stemmer.stem(input_word))
    elif stem_mode == 2:
        from nltk.stem import WordNetLemmatizer
        wordnet_lemmatizer = WordNetLemmatizer()
        file = file.split()
        for input_word in file:
            stemmed_file.append(wordnet_lemmatizer.lemmatize(input_word))
    else:
        print('Not Stemmed!')
        stemmed_file = file.split()
    return stemmed_file

def exclude_stop_words(file):
    """
    Args:
        file: stemed words in a list
    Returns:
        list, remove stopwords
    """
    from nltk.corpus import stopwords
    stop_words = set(stopwords.words('english'))
    words_filtered = []
    
    for word in file:
        if word not in stop_words:
            words_filtered.append(word)

    return words_filtered

'''
# 获取文件编码类型
import chardet
def get_file_encoding(file):
    # 二进制方式读取，获取字节数据，检测类型
    with open(file, 'rb') as f:
        data = f.read()
        encoding = chardet.detect(data)['encoding']
    return encoding
'''

# MAIN FUNCTIONS

# build text index and invert index
# store an index file with sqlite3
# [textID, text_path, ...(other features, like author)]
# [word, word frequency(df), textID1, textID2, ...]
def build_index_and_matrix():
    conn = sqlite3.connect(DB_INDEX_PATH)
    c = conn.cursor()
    c.execute('''DROP TABLE IF EXISTS texts''')
    c.execute('''CREATE TABLE texts
                    (textID INT PRIMARY KEY,
                    text_path TEXT NOT NULL);''')

    textID = 0
    worddict = {}
    for dirname, subdirnames, filenames in os.walk(DATA_PATH):
        for filename in filenames:
            file_path = os.path.join(dirname, filename)
            textID += 1
            t = (textID, file_path)
            c.execute('''INSERT INTO texts VALUES (?, ?)''', t)
            
            # file_encoding = get_file_encoding(file_path)
            with open(file_path) as f:
                try:
                    opened_file = f.readlines()
                except:
                    pass
            # 去邮件头
            pre_processed_file = pre_process_enron(opened_file)
            # 去标点
            stripped_file = strip_punct(pre_processed_file)
            # 词根化
            stemmed_file = stem_words(stripped_file)
            # 去停用词
            no_stop_word_file = exclude_stop_words(stemmed_file)
            prepared_file = no_stop_word_file
            
            words_in_file = prepared_file
            for word in words_in_file:
                if word in worddict:
                    # the word's first appear in this file
                    if worddict[word][1][-1] != textID:
                        worddict[word][0] += 1
                        worddict[word][1].append(textID)
                        worddict[word][2].append(1)
                    # the word appear several times in this file
                    else:
                        worddict[word][2][-1] += 1
                # the word appear for the first time
                else:
                    # [df, [Doc list], [tf list]]
                    worddict[word] = [1, [textID], [1]]

    c.execute('''DROP TABLE IF EXISTS variables''')
    c.execute('''CREATE TABLE variables
                (name TEXT PRIMARY KEY,
                value TEXT)''')
    text_num = textID
    t = ('text_num', text_num)
    c.execute('''INSERT INTO variables VALUES (?, ?)''', t)
    t = ('word_num', len(worddict))
    c.execute('''INSERT INTO variables VALUES (?, ?)''', t)

    # invindex for bool search
    c.execute('''DROP TABLE IF EXISTS invindex''')
    c.execute('''CREATE TABLE invindex
                    (word TEXT PRIMARY KEY,
                    word_df INT,
                    textIDs TEXT);''')
    
    for word, value in worddict.items():
        text_list = ' '.join(map(str, value[1]))
        t = (word, value[0], text_list)
        c.execute('''INSERT INTO invindex VALUES (?, ?, ?)''', t)
    
    conn.commit()
    conn.close()

    # tf-idf matrix for semantic search
    print("total text num:", text_num)
    word_arr = np.zeros(len(worddict), dtype='<U16')
    tfidf_mat = np.zeros((len(worddict), text_num))
    i = 0
    for word, value in worddict.items():
        word_arr[i] = word
        j = 0
        for textID in value[1]:
            tfidf_mat[i][textID - 1] = (1 + np.log10(value[2][j])) * np.log10(text_num / value[0])
            j += 1
        i += 1
    np.save(WORD_INDEX_PATH, word_arr)
    np.save(TFIDF_MAT_PATH, tfidf_mat)

# TEST FUNCTIONS

# test the two indexes
def testIndexes():
    conn = sqlite3.connect(DB_INDEX_PATH)
    c = conn.cursor()
    c.execute('''SELECT * FROM invindex
                LIMIT 3''')
    for row in c:
        print(row[0], row[1], row[2])

    conn.close()

def testTfidfMat():
    word_arr = np.load(WORD_INDEX_PATH)
    tfidf_mat = np.load(TFIDF_MAT_PATH)
    print(word_arr[0:5])
    print(tfidf_mat[0:5][0:5])

if __name__ == "__main__":
    t1 = time.time()

    build_index_and_matrix()
    testIndexes()
    testTfidfMat()

    t2 = time.time()
    print('build time used:', t2 - t1, 's')
