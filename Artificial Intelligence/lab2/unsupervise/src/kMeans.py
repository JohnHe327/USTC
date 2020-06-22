import numpy as np


def distance(x1, x2):
    res = np.sum(np.power(x1 - x2, 2))
    return np.sqrt(res)


def random_center(data, k):
    n = np.shape(data)[1]
    centroids = np.mat(np.zeros((k, n)))
    for i in range(n):
        min_j = min(data[:, i])
        range_j = float(max(np.array(data)[:, i]) - min_j)
        centroids[:, i] = min_j + range_j * np.random.rand(k, 1)
        """
        centroids[i, :] = data[i, :]
        """
    return centroids


def k_means(data, k):
    data_rows = np.shape(data)[0]
    cluster_assignment = np.mat(np.zeros((data_rows, 2)))  # [(cluster#, distance ** 2)]
    centroids = random_center(data, k)  # |k| * |feature|
    cluster_changed = True
    while cluster_changed:
        cluster_changed = False
        for i in range(data_rows):  # for each data point assign it to the closest centroid
            min_dist = np.inf
            min_index = -1
            for j in range(k):
                dist_ij = distance(centroids[j, :], data[i, :])
                if dist_ij < min_dist:
                    min_dist = dist_ij
                    min_index = j
            if cluster_assignment[i, 0] != min_index:
                cluster_changed = True
            cluster_assignment[i, :] = min_index, min_dist ** 2
        # calculate centroids
        for center in range(k):
            # get all the point in this cluster
            points_in_cluster = data[np.nonzero(cluster_assignment[:, 0].A == center)[0]]
            # assign centroid to mean
            centroids[center, :] = np.mean(points_in_cluster, axis=0)
    return centroids, cluster_assignment
