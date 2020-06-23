import numpy as np
import kMeans
import PCA


def load_data(file_name):
    raw_data = []
    # read all data
    with open(file_name, 'r') as inp_file:
        while True:
            inp_line = inp_file.readline()
            if inp_line == '':
                break
            raw_data.append(list(map(float, inp_line.split(','))))
    # separate cluster
    cluster = []
    for i in range(len(raw_data)):
        cluster.append(raw_data[i][0])
        raw_data[i] = raw_data[i][1:]
    raw_data = np.mat(raw_data)
    cluster = np.mat(cluster).T
    return raw_data, cluster


def main():
    inp_filename = '../input/wine.data'
    use_pca = int(input('use pca?: '))
    data, origin_cluster = load_data(inp_filename)

    # PCA
    threshold = 1.0
    if use_pca:
        threshold = float(input('threshold = '))
        data = PCA.pca(data, threshold)

    # k means
    max_cluster = int(input('max clusters = '))
    best_cluster = 0
    best_rand_index = 0
    best_silhouette = -1
    best_centroids = []
    best_assignment = []
    for k in range(max_cluster, 1, -1):
        # print('-----\nk =', k)
        centroids, cluster_assignment = kMeans.k_means(data, k)

        ss = sd = ds = dd = 0
        for i in range(len(origin_cluster)):
            for j in range(i + 1, len(origin_cluster)):
                if cluster_assignment[i, 0] == cluster_assignment[j, 0] and origin_cluster[i, 0] == origin_cluster[j, 0]:
                    ss += 1
                elif cluster_assignment[i, 0] == cluster_assignment[j, 0] and origin_cluster[i, 0] != origin_cluster[j, 0]:
                    sd += 1
                elif cluster_assignment[i, 0] != cluster_assignment[j, 0] and origin_cluster[i, 0] == origin_cluster[j, 0]:
                    ds += 1
                elif cluster_assignment[i, 0] != cluster_assignment[j, 0] and origin_cluster[i, 0] != origin_cluster[j, 0]:
                    dd += 1

        # calculate rand index
        rand_index = (ss + dd) / (ss + sd + ds + dd)
        # print('RI =', rand_index)

        # calculate a_i
        a = np.mat(np.zeros((len(data), len(data))))
        for i in range(len(data)):
            points = np.nonzero(cluster_assignment[:, 0].A == cluster_assignment[i, 0])[0]
            for p in points:
                if p > i:
                    a[i, p] = a[p, i] = kMeans.distance(data[i, :], data[p, :])
        total = a.sum(axis=1)  # sum up
        count = (a != 0).sum(axis=1)
        for i in range(len(count)):
            if count[i, 0] == 0:
                count[i, 0] = 1  # avoid nan
        a = total / count  # average

        # calculate b_i
        b = np.mat(np.zeros((len(data), 1)))
        count = np.mat(np.zeros((len(data), 1)))
        for i in range(len(data)):
            min_dist = np.inf
            min_index = -1
            for j in range(len(centroids)):
                dist_ij = kMeans.distance(centroids[j, :], data[i, :])
                if dist_ij < min_dist and j != cluster_assignment[i, 0]:  # ignore origin cluster
                    min_dist = dist_ij
                    min_index = j
            points = np.nonzero(cluster_assignment[:, 0].A == min_index)[0]
            count[i, 0] = len(points)
            for p in points:
                b[i, 0] += kMeans.distance(data[i, :], data[p, :])
        b = b / count

        # calculate max(a, b)
        max_ab = np.mat(np.zeros((len(data), 1)))
        for i in range(len(data)):
            max_ab[i, 0] = max(a[i, 0], b[i, 0])

        # SI
        silhouette_coe = (b - a) / max_ab
        # print('SI =', np.mean(silhouette_coe))

        # record best result
        if np.mean(silhouette_coe) > best_silhouette:
            best_cluster = k
            best_rand_index = rand_index
            best_silhouette = np.mean(silhouette_coe)
            best_centroids = centroids
            best_assignment = cluster_assignment[:, 0]

    # write file
    print('RI =', best_rand_index)
    if use_pca:
        output_file = '../output/use_pca.csv'
    else:
        output_file = '../output/no_pca.csv'
    with open(output_file, 'a') as fw:
        fw.write('threshold, ' + str(threshold))
        fw.write('\nfeatures, ' + str(data.shape[1]))
        fw.write('\nclusters, ' + str(best_cluster))
        fw.write('\nassignment, ')
        fw.write(str(list(map(int, best_assignment + 1)))[1: -1])
        fw.write('\nRI, ' + str(best_rand_index))
        fw.write('\n\n')


if __name__ == '__main__':
    main()
