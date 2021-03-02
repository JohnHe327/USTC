import numpy as np

TRAIN_DATA_PATH = "../data/training.dat"
TEST_DATA_PATH = "../data/testing.dat"
OUTPUT_PATH = "../output/ItemBasedOutput.txt"

MAX_UID = 2185  # 用户数
MAX_MID = 74683 # 电影数
NEAREST = 20    # 采用k近邻

# read train data
rank_matrix = np.matrix(np.zeros((MAX_MID,MAX_UID), dtype=np.int8, order='C'))
with open(TRAIN_DATA_PATH, 'r', encoding='UTF-8') as train_file:
    line = train_file.readline()
    while line:
        line = line.split(',')
        uid = int(line[0])
        mid = int(line[1])
        rnk = int(line[2])
        rank_matrix[mid,uid] = rnk
        line = train_file.readline()

# pred
avg = np.mean(rank_matrix, axis=1, dtype=np.float64)
with open(TEST_DATA_PATH, 'r', encoding='UTF-8') as test_file:
    with open(OUTPUT_PATH, 'w') as output_file:
        line = test_file.readline()
        while line:
            line = line.split(',')
            # 待预测位置
            test_uid = int(line[0])
            test_mid = int(line[1])
            # 寻找k近邻
            neighbors = {}
            for i in range(MAX_MID):
                if i != test_mid and rank_matrix[i,test_uid] != 0:
                    # 取出两行item
                    vec0 = rank_matrix[test_mid,:].A.flatten()
                    vec1 = rank_matrix[i,:].A.flatten()
                    # 减平均值，去中心化
                    vec0[vec0.nonzero()] = vec0[vec0.nonzero()] - avg[test_mid]
                    vec1[vec1.nonzero()] = vec1[vec1.nonzero()] - avg[i]
                    # 计算相似度
                    sim = np.inner(vec0,vec1)/(np.linalg.norm(vec0)*np.linalg.norm(vec1))
                    # 存储
                    if sim > 0:
                        neighbors[i] = sim
            if len(neighbors) < NEAREST:
                print(len(neighbors), "less than", NEAREST)
            if len(neighbors) == 0:
                # TODO: get avg
                pred = 0
                output_file.write(str(pred) + '\n')
                line = test_file.readline()
                continue

            first_k = np.matrix(sorted(neighbors.items(), key=lambda d: d[1], reverse=True)[:NEAREST],dtype=np.int32)
            
            ranks = rank_matrix[first_k[:,0], test_uid].A.flatten()
            sims = first_k[:,1].A.flatten()
            pred = np.inner(ranks, sims) / np.sum(sims)
            #pred = np.inner(rank_matrix[first_k[:,0],test_uid], first_k[:,1]) #/ np.sum(first_k[:,1])
            output_file.write(str(pred) + '\n')

            # 下一任务
            line = test_file.readline()
#round()
