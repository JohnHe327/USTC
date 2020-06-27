def manhattan_distance(a, b):
    dis = 0
    for i in range(len(a) - 1):
        dis += abs(a[i] - b[i])
    return dis


def knn(training_set, test_set, k):
    k = int(k)
    true_positive = 0
    true_negative = 0
    false_positive = 0
    false_negative = 0
    neighbours = []
    for test in test_set:
        if k < len(training_set):
            # first k training data
            for i in range(k):
                neighbours.append((i, manhattan_distance(test, training_set[i])))
            neighbours = sorted(neighbours, key=lambda arr: arr[1])
            # others
            for i in range(k + 1, len(training_set)):
                dis = manhattan_distance(test, training_set[i])
                if dis < neighbours[-1][1]:
                    neighbours[-1] = (i, dis)
                    neighbours = sorted(neighbours, key=lambda arr: arr[1])
            # predict
            pos = 0
            for i in range(k):
                if training_set[neighbours[i][0]][-1] >= 10:
                    pos += 1
        else:
            pos = 0
            for train in training_set:
                if train[-1] >= 10:
                    pos += 1
        pos = 2 * pos >= k
        # check answer
        if pos and test[-1] >= 10:
            true_positive += 1
        elif pos and not test[-1] >= 10:
            false_positive += 1
        elif not pos and not test[-1] >= 10:
            true_negative += 1
        elif not pos and test[-1] >= 10:
            false_negative += 1
        # clear neighbours
        neighbours = []
    return true_positive, true_negative, false_positive, false_negative
