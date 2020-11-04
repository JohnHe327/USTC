import os.path
import re
import sqlite3
import string

# DATA_PATH = "../dataset/maildir"
DATA_PATH = "../sub_dataset/maildir"
DB_INDEX_PATH = "../output/index.db"
STOPWORDS_PATH = "stopwords.txt"

# HELPER FUNCTIONS

# special pre_process for enron dataset
def pre_process_enron(file):
    pass
    return file

def strip_punct(file):
    punctre = re.compile('[%s]' % re.escape(string.punctuation))
    nopunct = punctre.sub('',file)
    return nopunct

def stem_words(file):
    pass
    return file.lower()

def exclude_stop_words(file):
    pass
    return file

# MAIN FUNCTIONS

# build text index and invert index
# store an index file with sqlite3
# [textID, text_path, ...(other features, like author)]
# [word, word frequency(df), textID1, textID2, ...]
def buildTextIndexAndInvIndex():
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
            
            with open(file_path) as f:
                opened_file = f.read().replace('\n', ' ')
            pre_processed_file = pre_process_enron(opened_file)
            stripped_file = strip_punct(pre_processed_file)
            stemmed_file = stem_words(stripped_file)
            no_stop_word_file = exclude_stop_words(stemmed_file)
            prepared_file = no_stop_word_file
            
            words_in_file = prepared_file.split()
            for word in words_in_file:
                if word in worddict:
                    worddict[word][0] += 1
                    if worddict[word][1][-1] != textID:
                        worddict[word][1].append(textID)
                else:
                    worddict[word] = [1, [textID]]
    
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

# TEST FUNCTIONS

# test the two indexes
def testIndexes():
    conn = sqlite3.connect(DB_INDEX_PATH)
    c = conn.cursor()
    c.execute('''SELECT * FROM invindex
                LIMIT 1''')
    for row in c:
        print(row[0], row[1], row[2])

    conn.close()

if __name__ == "__main__":
    buildTextIndexAndInvIndex()
    testIndexes()
    