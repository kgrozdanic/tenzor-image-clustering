Startup

[X_train, y_train, X_test, y_test] = LoadZnamenke();
load('Ws.mat')
W_corr_sigmoid = 1 ./ (8*exp(-W_corr) + 1);

% fea = reshape(X_train, [], 16*16);
% options = [];
% options.Metric = 'Euclidean';
% options.NeighborMode = 'KNN';
% options.k = 50;
% options.WeightMode = 'HeatKernel';
% options.t = 10;
% W_mse = constructW(fea,options);
% imagesc(W_mse);
% S = GetNeighbourMatrixS(W_corr, 40); % imagesc(W_corr .* S)
% S = GetNeighbourMatrixS(W_mse, 20); imagesc(W_mse.* S)


figure; imagesc(W_corr); title('W-corr');
figure; imagesc(W_corr_sigmoid); title('W-corr-sigmoid');

S = GetNeighbourMatrixS(W_corr_sigmoid, 40);
figure; imagesc(S); title('S');

UsedMatrix = W_corr_sigmoid .* S;
figure; imagesc(UsedMatrix); title('W-corr-sigmoid * S;')

[U, V] = GetUV(UsedMatrix, X_train); % 0.1608
% [U, V] = GetUV(W_mse, X_train);
% [U, V] = GetUV(S, X_train);

ApplyTensorImage(X_train, y_train, U, V, 1, 2);
ApplyTensorImage(X_train, y_train, U, V, 2, 1);


PlotAccuracy(X_train, y_train, U, V, 2, 14);

% normalized cuts

disp('____S____')
ApplyNormCut(S, 10, y_train);

disp('____W_corr____')
ApplyNormCut(W_corr, 10, y_train);

disp('____W_corr_sigmoid____')
ApplyNormCut(W_corr_sigmoid, 10, y_train);

disp('____UsedMatrix____')
ApplyNormCut(UsedMatrix, 10, y_train);
