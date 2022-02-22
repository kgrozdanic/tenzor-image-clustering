function X = DACA(W, k, knn)

    epsilon = 1e-3;
    n = length(W);
        
    W = W .* getW_z(W, knn); % W -> W_kapa
    %imagesc(W_kapa), colorbar

    % D_kapa = diag(W * ones(n, 1));
    % Q = D_kapa - W; % (D - W)e = 0;
    % Q = Q + epsilon * eye(n); % da ne bude singularna matrica
    
    Q = diag(W * ones(n, 1)) - W + epsilon * eye(n);
    
    %imagesc(Q), colorbar;
    
    
    

    [P_t, Ls] = eigs(Q \ W, k); % P_tilda
  
    % Normiranje redova
    % P_t = P_t * diag(sum(P_t.^2, 1) .^ (-0.5)); % normirat cemo rucno jer moze biti 0 na dijagonalama
           
    row_norms = diag(P_t * P_t');
    row_norms(row_norms < 1e-16) = 1;
    %X_t = diag(row_norms) ^ -0.5 * P_t;
    P_t = diag(row_norms) ^ -0.5 * P_t;
    
    X = Iter(P_t, n, k);
    
end