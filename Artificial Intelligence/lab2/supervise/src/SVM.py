import numpy as np
from random import randint


class DataStructure:
    def __init__(self, data_mat_in, label_mat_in, C, tolerate, eps):
        self.dataMat = data_mat_in  # 样本数据
        self.labelMat = label_mat_in  # 样本标签
        self.C = C  # 参数C
        self.tolerate = tolerate  # 容错率
        self.eps = eps  # 乘子更新最小比率
        self.m = np.shape(data_mat_in)[0]  # 样本数
        self.alphas = np.mat(np.zeros((self.m, 1)))  # 拉格朗日乘子alphas
        self.b = 0  # 参数b
        self.eCache = np.mat(np.zeros((self.m, 2)))  # 误差cache


def load_data(training_set):
    data_mat = []
    label_mat = []
    for line in training_set:
        data_mat.append(list(map(float, line[0: -1])))
        if line[-1] >= 10:
            label_mat.append(1)
        else:
            label_mat.append(-1)
    data_mat = np.mat(data_mat)
    label_mat = np.mat(label_mat).T
    return data_mat, label_mat


def kernel(x1, x2, method):
    if method[0] == 'linear':
        return np.dot(x1, x2)
    elif method[0] == 'poly':
        return np.multiply((1 + np.dot(x1, x2)), (1 + np.dot(x1, x2)))
    elif method[0] == 'rbf':
        m, n = np.shape(x1)
        result = np.mat(np.zeros((m, 1)))
        for i in range(m):
            row = x1[i, :] - x2.T
            result[i] = row * row.T
        result = np.exp(result / (-1 * method[1] ** 2))
        return result


def take_step(i1, i2, ds, kernel_method):
    if i1 == i2:
        # print('i1 == i2')
        return 0

    alpha1 = ds.alphas[i1, 0]
    alpha2 = ds.alphas[i2, 0]
    y1 = ds.labelMat[i1]
    y2 = ds.labelMat[i2]

    # get e1
    if ds.eCache[i1, 0] == 1:
        e1 = ds.eCache[i1, 1]
    else:
        u1 = (np.multiply(ds.alphas, ds.labelMat)).T * kernel(ds.dataMat, ds.dataMat[i1, :].T, kernel_method) + ds.b
        e1 = float(u1 - y1)

    # get e2
    if ds.eCache[i2, 0] == 1:
        e2 = ds.eCache[i2, 1]
    else:
        u2 = (np.multiply(ds.alphas, ds.labelMat)).T * kernel(ds.dataMat, ds.dataMat[i2, :].T, kernel_method) + ds.b
        e2 = float(u2 - y2)

    s = y1 * y2
    lower_bound = 0
    higher_bound = 0
    if s == 1:  # y1 == y2
        lower_bound = max(0, alpha1 + alpha2 - ds.C)
        higher_bound = min(ds.C, alpha1 + alpha2)
    elif s == -1:  # y1 != y2
        lower_bound = max(0, alpha2 - alpha1)
        higher_bound = min(ds.C, ds.C + alpha2 - alpha1)
    if lower_bound == higher_bound:
        # print('L==H')
        return 0

    # 计算学习率eta
    k_11 = kernel(ds.dataMat[i1, :], ds.dataMat[i1, :].T, kernel_method)
    k_12 = kernel(ds.dataMat[i1, :], ds.dataMat[i2, :].T, kernel_method)
    k_22 = kernel(ds.dataMat[i2, :], ds.dataMat[i2, :].T, kernel_method)
    eta = k_11 - 2 * k_12 + k_22

    # calculate new alpha2
    if eta > 0:
        a2 = alpha2 + y2 * (e1 - e2) / eta
        if a2 < lower_bound:
            a2 = lower_bound
        elif a2 > higher_bound:
            a2 = higher_bound
    else:
        # print('eta <= 0')
        return 0

    # quit if update too small
    if abs(a2 - alpha2) < ds.eps * (a2 + alpha2 + ds.eps):
        # print('too small update on alpha2')
        return 0

    # calculate new alpha1
    a1 = alpha1 + s * (alpha2 - a2)

    # update ds.b
    b1 = -e1 + y1 * (alpha1 - a1) * kernel(ds.dataMat[i1, :], ds.dataMat[i1, :].T, kernel_method) \
            + y2 * (alpha2 - a2) * kernel(ds.dataMat[i1, :], ds.dataMat[i2, :].T, kernel_method) + ds.b
    b2 = -e2 + y1 * (alpha1 - a1) * kernel(ds.dataMat[i1, :], ds.dataMat[i2, :].T, kernel_method) \
            + y2 * (alpha2 - a2) * kernel(ds.dataMat[i2, :], ds.dataMat[i2, :].T, kernel_method) + ds.b
    if 0 < a1 < ds.C:
        ds.b = b1
    elif 0 < a2 < ds.C:
        ds.b = b2
    else:
        ds.b = (b1 + b2) / 2

    # update alpha1 & alpha2
    ds.alphas[i1] = a1
    ds.alphas[i2] = a2

    # update e cache
    valid_alphas_list = np.nonzero(ds.alphas.A)[0]
    ds.eCache = np.mat(np.zeros((ds.m, 2)))
    for k in valid_alphas_list:
        uk = np.multiply(ds.alphas, ds.labelMat).T.dot(kernel(ds.dataMat, ds.dataMat[k, :].T, kernel_method)) + ds.b
        yk = ds.labelMat[k, 0]
        ek = float(uk - yk)
        ds.eCache[k] = [1, ek]
    # print('updated')
    return 1


def examine_example(i2, ds, kernel_method):
    y2 = ds.labelMat[i2, 0]
    alpha2 = ds.alphas[i2, 0]

    # get e2
    if ds.eCache[i2, 0] == 1:
        e2 = ds.eCache[i2, 1]
    else:
        u2 = (np.multiply(ds.alphas, ds.labelMat)).T * kernel(ds.dataMat, ds.dataMat[i2, :].T, kernel_method) + ds.b
        e2 = float(u2 - y2)

    r2 = e2 * y2
    # check alpha2 KKT
    if r2 < -ds.tolerate and alpha2 < ds.C or r2 > ds.tolerate and alpha2 > 0:
        '''
        # random alpha1
        i1 = randint(0, ds.m-1)
        if(take_step(i1, i2, ds)):
            return 1
        '''

        # heuristic alpha1
        non_zero_alphas_list = np.nonzero(ds.alphas.A)[0].tolist()  # not zero
        non_c_alphas_list = np.nonzero((ds.alphas - ds.C).A)[0].tolist()  # not C
        non_bound_alphas_list = list(set(non_zero_alphas_list) & set(non_c_alphas_list))  # not bound

        # find e1 st. max |e1-e2|
        if len(non_bound_alphas_list) > 1:
            max_e = 0
            max_e_index = 0
            for k in non_bound_alphas_list:
                if abs(ds.eCache[k, 1] - e2) > max_e:
                    max_e = abs(ds.eCache[k, 1] - e2)
                    max_e_index = k
            i1 = max_e_index
            if take_step(i1, i2, ds, kernel_method):
                return 1

            # i1未效更新，从随机开始处遍历整个非边界alpha作为i1
            random_start = randint(0, len(non_bound_alphas_list) - 1)
            for i1 in range(random_start, len(non_bound_alphas_list)):
                if i1 == i2:
                    continue
                if take_step(i1, i2, ds, kernel_method):
                    return 1
            for i1 in range(0, random_start):
                if i1 == i2:
                    continue
                if take_step(i1, i2, ds, kernel_method):
                    return 1

        # 随机位置开始遍历
        random_start = randint(0, ds.m - 1)
        for i1 in range(random_start, ds.m):
            if i1 == i2:
                continue
            if take_step(i1, i2, ds, kernel_method):
                return 1
        for i1 in range(0, random_start):
            if i1 == i2:
                continue
            if take_step(i1, i2, ds, kernel_method):
                return 1

    return 0


def svm(training_set, test_set, C, kernel_method):
    # initialize
    data_mat, label_mat = load_data(training_set)
    ds = DataStructure(data_mat, label_mat, C, 0.001, 0.01)  # init data_mat_in, label_mat_in, C, tolerate, eps

    # smo solve
    num_changed = 0
    examine_all = True
    while num_changed > 0 or examine_all:
        num_changed = 0
        if examine_all:
            for i in range(ds.m):
                num_changed += examine_example(i, ds, kernel_method)
        else:
            for i in range(ds.m):
                if ds.alphas[i] == 0 or ds.alphas[i] == ds.C:
                    continue
                num_changed += examine_example(i, ds, kernel_method)
        if examine_all:
            examine_all = False
        elif num_changed == 0:
            examine_all = True
    # weight = np.dot(ds.dataMat.T, np.multiply(ds.labelMat, ds.alphas))

    # test
    true_positive = 0
    true_negative = 0
    false_positive = 0
    false_negative = 0
    for t in test_set:
        input_test = np.mat(t[0: -1]).T
        prediction = (np.dot(np.multiply(ds.alphas, ds.labelMat).T, kernel(ds.dataMat, input_test, kernel_method)) + ds.b) > 0
        answer = t[-1] >= 10
        if prediction and answer:
            true_positive += 1
        elif prediction and not answer:
            false_positive += 1
        elif not prediction and not answer:
            true_negative += 1
        elif not prediction and answer:
            false_negative += 1

    return true_positive, true_negative, false_positive, false_negative
