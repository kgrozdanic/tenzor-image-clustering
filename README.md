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
2. Uvjeriti se da stvari rade kako treba ✅
3. Funkcija za plotanje rezultata ✅
4. Primijeniti kmeans na output transformacije prostora
5. Napraviti dataset ili više njih
6. Naći matlab fje za LLE, ncut MSC i slično

Primjeri koje pokazujemo:
1. imagesc(W)
2. Padajući graf funkcije cilja
3. Tensor space T2
4. Accuracy


http://www.cad.zju.edu.cn/home/dengcai/Data/DimensionReduction.html <- "TensorLPP"
