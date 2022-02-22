Startup

[X_train, y_train, X_test, y_test] = LoadFaces();
% W_mse = GetSimilarityMatrixW(X_train, "corr");
% S = GetNeighbourMatrixS(W_mse, 20); imagesc(W_mse.* S)
% [U, V] = GetUV(S .* W_mse, X_train);
% [U, V] = GetUV(W, X_train);
% [U, V] = GetUV(S, X_train);
% xy = ApplyTensorImage(X_train, y_train, U, V, 5, 5);
% idx = kmeans(xy, 11);
% [Acc, ~ ,match] = AccMeasure(y_train, idx)


fea = reshape(X_train, [], 32*32);
options = [];
options.Metric = 'Euclidean';
options.NeighborMode = 'KNN';
options.k = 10;
options.WeightMode = 'HeatKernel';
options.t = 5;
W = constructW(fea,options);
% S = GetNeighbourMatrixS(W, 20); imagesc(W.* S)
% [U, V, eigvalue_U, eigvalue_V, posIdx, Y] = TensorLGE(X_train, W);
[U, V] = GetUV(W, X_train);


%NASTAVLJAM NASIM KODOM!
xy = ApplyTensorImage(X_train, y_train, U, V, 2, 1);
idx = kmeans(xy, 11);
[Acc, ~ ,match] = AccMeasure(y_train, idx)