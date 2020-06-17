import random
import math
import KNN
import SVM
import DecisionTree as dt

jobs = {'"teacher"': 0, '"health"': 1, '"services"': 2, '"at_home"': 3, '"other"': 4}
reasons = {'"course"': 0, '"reputation"': 1, '"home"': 2, '"other"': 3}  # 2 1 0 3 ?
guardians = {'"mother"': 0, '"father"': 1, '"other"': 2}


def formatting(line, use_g):
    line[0] = int(line[0] == '"MS"')  # school
    line[1] = int(line[1] == '"M"')  # sex
    line[2] = int(line[2])  # age
    line[3] = int(line[3] == '"R"')  # address
    line[4] = int(line[4] == '"GT3"')  # family size
    line[5] = int(line[5] == '"A"')  # parent status
    line[6] = int(line[6])  # mother education
    line[7] = int(line[7])  # father education
    line[8] = jobs[line[8]]  # mother job
    line[9] = jobs[line[9]]  # father job
    line[10] = reasons[line[10]]  # reason
    line[11] = guardians[line[11]]  # guardian
    line[12] = int(line[12])  # travel time
    line[13] = int(line[13])  # study time
    line[14] = int(line[14])  # failures
    line[15] = int(line[15] == '"yes"')  # extra educational support
    line[16] = int(line[16] == '"yes"')  # family educational support
    line[17] = int(line[17] == '"yes"')  # extra paid classes within the course subject
    line[18] = int(line[18] == '"yes"')  # extra-curricular activities
    line[19] = int(line[19] == '"yes"')  # attended nursery school
    line[20] = int(line[20] == '"yes"')  # wants to take higher education
    line[21] = int(line[21] == '"yes"')  # Internet access at home
    line[22] = int(line[22] == '"yes"')  # with a romantic relationship
    line[23] = int(line[23])  # quality of family relationships
    line[24] = int(line[24])  # free time after school
    line[25] = int(line[25])  # going out with friends
    line[26] = int(line[26])  # workday alcohol
    line[27] = int(line[27])  # weekend alcohol
    line[28] = int(line[28])  # current health status
    line[29] = int(line[29])  # number of school absences
    if use_g:
        line[30] = int(line[30][1: -1])  # G1
        line[31] = int(line[31][1: -1])  # G2
    else:
        line[30] = line[31] = 0
    line[32] = int(line[32])  # G3
    return line


if __name__ == '__main__':
    filename = input('data file [mat/por]: \n')
    filename = '../data/student/student-' + filename + '.csv'
    print('Opening "' + filename + '"')
    # test file
    inp_file = open(filename, 'r')
    inp_file.close()
    algorithm = input('algorithm [Knn/Svm/Decision_tree]: \n')[0].lower()
    use_grade = input('use grade [Yes/No]: \n')[0].lower() == 'y'
    if algorithm == 'k':
        k = input('k = ')
    elif algorithm == 's':
        kernel_function = input('kernel [Linear/Poly/Rbf]: \n')[0].lower()
        if kernel_function == 'l':
            kernel_function = ['linear']
        elif kernel_function == 'p':
            kernel_function = ['poly']
        elif kernel_function == 'r':
            kernel_function = ['rbf']
            sigma = float(input('sigma = '))
            kernel_function.append(sigma)
        else:
            print('unknown kernel function')
            kernel_function = ['linear']
        C = float(input('C = '))
    elif algorithm == 'd':
        pass
    test_iter = int(input('iteration = '))

    score_avg = 0.0
    for iteration in range(test_iter):
        inp_file = open(filename, 'r')
        inp_file.readline().split(';')  # read header
        # prepare all data
        data = []
        inp = ''
        while True:
            inp = inp_file.readline()
            if inp == '':
                break
            inp = formatting(inp.split(';'), use_grade)
            data.append(inp)
        # prepare training set & test set
        lines = len(data)
        training_set = []
        test_set = []
        max_train_set = math.floor(0.7 * lines)
        max_test_set = lines - max_train_set
        for i in range(lines):
            if len(test_set) >= max_test_set or len(training_set) < max_train_set and random.randint(0, 9) < 7:
                training_set.append(data[i])
            else:
                test_set.append(data[i])
        # test
        tp = tn = fp = fn = 0
        if algorithm == 'k':
            tp, tn, fp, fn = KNN.knn(training_set, test_set, k)
        elif algorithm == 's':
            tp, tn, fp, fn = SVM.svm(training_set, test_set, C, kernel_function)
        elif algorithm == 'd':
            tp, tn, fp, fn = dt.decision_tree(training_set, test_set)
        # measure result
        if tp + tn + fp + fn == len(test_set):
            P = tp / (tp + fp)
            R = tp / (tp + fn)
            f1_score = 2 * P * R / (P + R)
            print('F1 score = {:.2%}'.format(f1_score))
            score_avg += f1_score
        else:
            print('error in testing result!')
            inp_file.close()
            break
        # close file
        inp_file.close()

    # average score
    score_avg /= iteration + 1
    print('\nAverage score = {:.2%}'.format(score_avg))
