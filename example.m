Startup

[X_train, y_train, X_test, y_test] = LoadZnamenke();
load('Ws.mat')
S = GetNeighbourMatrixS(W_corr, 40); imagesc(W_corr .* S)

[U, V] = GetUV(S .* W_corr, X_train); % 0.1608

ApplyTensorImage(X_train, y_train, U, V, 1, 2)
ApplyTensorImage(X_train, y_train, U, V, 2, 1)