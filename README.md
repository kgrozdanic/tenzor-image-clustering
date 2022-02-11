# tenzor-image-clustering

### temp - pozivi funkcija
[X_train, y_train, X_test, y_test] = load_znamenke();

W_mse = get_similarity_matrix(X_train, "mse"); % ili load('Ws.mat');

S = get_neighbour_matrix_S(W_mse, 30);

[U, V] = getUV(S, X_train);

plot_results(X_train, y_train, U, V, 1, 2); % T(1, 2)

plot_results(X_train, y_train, U, V, 2, 1); % T(2, 1)

TODO:
1. Dobiti matricu <strong>S</strong> najbližih susjedstva ✅
2. Funkcija za plotanje rezultata
3. Napraviti dataset ili više njih
4. Naći matlab fje za LLE, ncut MSC i slično
