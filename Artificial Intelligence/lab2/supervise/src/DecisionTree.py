from math import log2
from random import randint


def reform_data(data_set):
    for i in range(len(data_set)):
        data_set[i][-3] = int(data_set[i][-3] >= 10)
        data_set[i][-2] = int(data_set[i][-2] >= 10)
        data_set[i][-1] = int(data_set[i][-1] >= 10)
    return data_set


def cal_entropy(data_set):
    labels = [data[-1] for data in data_set]
    rows = len(labels)

    label_count = {}
    for label in labels:
        if label not in label_count.keys():
            label_count[label] = 0
        label_count[label] += 1

    entropy = 0.0
    for key in label_count.keys():
        p_i = float(label_count[key] / rows)
        entropy -= p_i * log2(p_i)
    return entropy


def split_data_set(data_set, feature_index, feature_value):
    data_split = []
    for data in data_set:
        if data[feature_index] == feature_value:
            new_data = data[:feature_index] + data[feature_index + 1:]
            data_split.append(new_data)
    return data_split


def choose_split_index(data_set):
    feature_count = len(data_set[0]) - 1
    origin_entropy = cal_entropy(data_set)

    max_info_gain = 0.0
    split_index = -1
    for i in range(feature_count):
        feature_list = set([data[i] for data in data_set])
        # calculate entropy when split data with feature[i]
        new_entropy = 0.0
        for feature in feature_list:
            data_subset = split_data_set(data_set, i, feature)  # get [data[i] == feature]
            p_i = len(data_subset) / len(data_set)
            new_entropy += p_i * cal_entropy(data_subset)
        # record best split
        info_gain = origin_entropy - new_entropy
        if info_gain > max_info_gain:
            max_info_gain = info_gain
            split_index = i

    return split_index


def majority_in_label(label_set):
    label_count = {}
    for label in label_set:
        if label not in label_count.keys():
            label_count[label] = 0
        label_count[label] += 1
    return sorted(label_count, key=lambda x: label_count[x], reverse=True)[0]


def build_decision_tree(data_set, features):
    label_set = [data[-1] for data in data_set]

    # only 1 category left
    if label_set.count(label_set[0]) == len(label_set):
        return label_set[0]

    # finish dividing
    if len(data_set[0]) == 1:
        return majority_in_label(label_set)

    # choose best feature
    best_feature_index = choose_split_index(data_set)
    best_feature_name = features[best_feature_index]
    del (features[best_feature_index])
    tree = {best_feature_name: {}}

    # create branches
    feature_values = [data[best_feature_index] for data in data_set]
    feature_values = sorted(list(set(feature_values)))
    for value in feature_values:
        tree[best_feature_name][value] = build_decision_tree(split_data_set(data_set, best_feature_index, value),
                                                             features[:])
    return tree


def classify(tree, features, data):
    prediction = ''
    root = list(tree.keys())[0]
    branches = tree[root]
    index = features.index(root)
    for key in branches.keys():
        if data[index] == key:
            if isinstance(branches[key], dict):
                prediction = classify(branches[key], features, data)
            else:
                prediction = branches[key]

    if not isinstance(prediction, int):
        prediction = randint(0, 1)
    return prediction


def decision_tree(training_set, test_set):
    training_set = reform_data(training_set)
    test_set = reform_data(test_set)
    features = ['school', 'sex', 'age', 'address', 'family size', 'parent status', 'mother education',
                'father education', 'mother job', 'father job', 'reason', 'guardian', 'travel time', 'study time',
                'failures', 'extra educational support', 'family educational support',
                'extra paid classes within the course subject', 'extra-curricular activities',
                'attended nursery school', 'wants to take higher education', 'Internet access at home',
                'with a romantic relationship', 'quality of family relationships', 'free time after school',
                'going out with friends', 'workday alcohol', 'weekend alcohol', 'current health status',
                'number of school absences', 'G1', 'G2']

    # train
    tree = build_decision_tree(training_set, features[:])

    # test
    true_positive = 0
    true_negative = 0
    false_positive = 0
    false_negative = 0
    for t in test_set:
        prediction = classify(tree, features, t[:-1])
        if prediction and t[-1]:
            true_positive += 1
        elif prediction and not t[-1]:
            false_positive += 1
        elif not prediction and not t[-1]:
            true_negative += 1
        elif not prediction and t[-1]:
            false_negative += 1

    return true_positive, true_negative, false_positive, false_negative
