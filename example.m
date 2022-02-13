startup

[X_train, y_train, X_test, y_test] = load_znamenke();
load('Ws.mat')
S = get_neighbour_matrix_S(W_corr, 40); imagesc(W_corr .* S)

[U, V] = getUV(S .* W_corr, X_train); % 0.1608

plot_results(X_train, y_train, U, V, 1, 2)
plot_results(X_train, y_train, U, V, 2, 1)