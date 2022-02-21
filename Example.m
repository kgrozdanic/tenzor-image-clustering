Startup

[X_train, y_train, X_test, y_test] = LoadZnamenke();
% load('Ws.mat')
fea = reshape(X_train, [], 16*16);
options = [];
options.Metric = 'Euclidean';
options.NeighborMode = 'KNN';
options.k = 50;
options.WeightMode = 'HeatKernel';
options.t = 10;
W_mse = constructW(fea,options);
imagesc(W_mse);
%S = GetNeighbourMatrixS(W_corr, 40); imagesc(W_corr .* S)
% S = GetNeighbourMatrixS(W_mse, 20); imagesc(W_mse.* S)

% [U, V] = GetUV(S .* W_corr, X_train); % 0.1608
% [U, V] = GetUV(W_mse, X_train);
% [U, V] = GetUV(S, X_train);

%ApplyTensorImage(X_train, y_train, U, V, 1, 2)
%ApplyTensorImage(X_train, y_train, U, V, 2, 1)

% xy = ApplyTensorImage(X_train, y_train, U, V, 3, 3);
% idx = kmeans(xy, 10);
% [Acc,rand_index,match] = AccMeasure(y_train, idx)