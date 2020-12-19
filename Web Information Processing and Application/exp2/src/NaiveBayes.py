from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.naive_bayes import MultinomialNB
from sklearn.metrics import accuracy_score

TRAIN_DATA_PATH = "../data/train.txt"
TEST_DATA_PATH  = "../data/test.txt"
ALL_ANS         = "../data/TRAIN_FILE.txt"
OUTPUT_PATH     = "../output/result_nb.txt"
TRAIN_SIZE = 6400
TEST_SIZE = 1600

target_names = ['Cause-Effect', 'Component-Whole', 'Entity-Destination', 'Product-Producer', 'Entity-Origin',
                'Member-Collection', 'Message-Topic', 'Content-Container', 'Instrument-Agency', 'Other']

# read train data
train_data = []
train_target = []
with open(TRAIN_DATA_PATH) as f:
   while len(train_data) < TRAIN_SIZE:
      train_data.append(f.readline().split('"')[1])
      train_target.append(target_names.index(f.readline().split('(')[0]))

# tfidf vectorize
vectorizer = TfidfVectorizer()
train_vectors = vectorizer.fit_transform(train_data)

# read test data
test_data = []
with open(TEST_DATA_PATH) as f:
   while len(test_data) < TEST_SIZE:
      test_data.append(f.readline().split('"')[1])
test_vectors = vectorizer.transform(test_data)

# get test answer
with open(ALL_ANS) as f:
    rawfile = f.readlines()
    all_target = [target_names.index(rawfile[i][:-1]) for i in range(24000) if i % 3 == 1]
test_target_ans = all_target[-TEST_SIZE:]

# train
classifier = MultinomialNB(alpha=0.0675)
classifier.fit(train_vectors, train_target)

# predict
predictions = classifier.predict(test_vectors)

# calculate accuracy
print('acc:', accuracy_score(test_target_ans, predictions))

# write prediction result
with open(OUTPUT_PATH, 'w') as f:
    for i in range(TEST_SIZE):
        f.write(target_names[predictions[i]] + '\n')
        #f.write(target_names[predictions[i]] + '\t' + target_names[test_target_ans[i]] + '\n')

# result-ans mat
import numpy as np
results_mat = np.zeros((10,10))
for i in range(TEST_SIZE):
    results_mat[predictions[i], test_target_ans[i]] = results_mat[predictions[i], test_target_ans[i]] + 1
print(results_mat)
