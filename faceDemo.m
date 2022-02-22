Startup

k = 5;
[X_train, y_train, X_test, y_test] = loadExtended(k);


% W_mse = GetSimilarityMatrixW(X_train, "corr");
% S = GetNeighbourMatrixS(W_mse, 20); imagesc(W_mse.* S)
% [U, V] = GetUV(S .* W_mse, X_train);
% [U, V] = GetUV(W, X_train);
% [U, V] = GetUV(S, X_train);
% xy = ApplyTensorImage(X_train, y_train, U, V, 5, 5);
% idx = kmeans(xy, 11);
% [Acc, ~ ,match] = AccMeasure(y_train, idx)


dataX = X_train;
datay = y_train;

fea = reshape(dataX, [], 32*32);
options = [];
options.Metric = 'Euclidean';
options.NeighborMode = 'KNN';
options.k = 10;
options.WeightMode = 'HeatKernel';
options.t = 2;
W = constructW(fea,options);
% S = GetNeighbourMatrixS(W, 20);
figure(); imagesc(W); colormap(gray);


%NASTAVLJAM NASIM KODOM!
[U, V] = GetUV(W, dataX);
projection_dim = 5;
xy = ApplyTensorImage(dataX, datay, U, V, projection_dim, projection_dim); idx = kmeans(xy, k); [Acc, ~ ,match] = AccMeasure(datay, idx)

% %njihovo!
% [U, V, eigvalue_U, eigvalue_V, posIdx, Y] = TensorLGE(dataX, W);
% xy_external = ApplyTensorImage(dataX, datay, U, V, projection_dim, projection_dim);
% idx_external = kmeans(xy_external, k);
% [Acc, ~ ,match] = AccMeasure(datay, idx_external)


