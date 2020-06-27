import numpy as np


def pca(data, threshold):
    # mean of each feature
    features_cnt = np.shape(data)[1]
    mean = np.array([np.mean(data[:, i]) for i in range(features_cnt)])
    # normalization
    norm_data = data - mean

    # scatter matrix data
    scatter_matrix_data = np.dot(np.transpose(norm_data), norm_data)

    # Calculate eigenvector and eigenvalue
    eig_val, eig_vec = np.linalg.eig(scatter_matrix_data)
    eig_pairs = [(np.abs(eig_val[i]), eig_vec[:, i]) for i in range(features_cnt)]
    # sort eig_vec based on eig_val from highest to lowest
    eig_pairs.sort(reverse=True)

    # select the top k eig_vec
    sum_all_eigenvalue = 0
    for ele in eig_pairs:
        sum_all_eigenvalue += ele[0]
    first_k_eigenvalue = 0
    k = 0
    for ele in eig_pairs:
        first_k_eigenvalue += ele[0]
        k += 1
        # print(first_k_eigenvalue / sum_all_eigenvalue)
        if first_k_eigenvalue / sum_all_eigenvalue >= threshold:
            break
    feature = np.array([ele[1] for ele in eig_pairs[:k]])

    # get new data
    data = np.dot(norm_data, np.transpose(feature))
    if k == 1:
        data = data.T

    return data
