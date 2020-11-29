import numpy as np
import utils
import time

from build_index_and_matrix import WORD_INDEX_PATH, TFIDF_MAT_PATH
from build_index_and_matrix import stem_words

def search(query):
    word_index = np.load(WORD_INDEX_PATH)
    tfidf_mat = np.load(TFIDF_MAT_PATH)
    query_vector = np.zeros(len(word_index))
    for word in stem_words(query):
        index = np.where(word_index == word)
        query_vector[index] = 1

    tfidf_norm2 = np.sum(tfidf_mat*tfidf_mat, axis=0)
    cos_sim = np.dot(query_vector, tfidf_mat) / (tfidf_norm2 + 1e-5)
    top10index = np.argsort(-cos_sim)[0:10]

    for index in top10index:
        print(utils.searchFilePath(index + 1), "cosine similarity: ", cos_sim[index])

    return top10index
    
if __name__ == "__main__":
    query_str = input("Please input your semantic query (words seperated with space): ")
    t1 = time.time()
    search(query_str)
    t2 = time.time()
    print('semantic search time: ', t2 - t1, 's')
