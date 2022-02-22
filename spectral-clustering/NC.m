function X_z = NC(W, K)
  
  n = length(W); % n = max(size(W));
  
  % korak 1 
  D = diag(W * ones(n, 1));
  
  % korak 2
  H = (D ^ -0.5) * W * (D ^ -0.5);
  [V, S] = eigs(H, n);
  
  %[~, ind] = sort(diag(S), 'descend');
  %V = V(:, ind(1:K));
  Eps = trace(S);

  %Z = V(:, 1:K); 
  Z = (D ^ -0.5) * V(:, 1:K); % opcionalno
  
  % korak 3
  X_tz = diag(diag(Z * Z')) ^ (-0.5) * Z; % X tilda zvjezdica
  
  X_z = Iter(X_tz, n, K); % X zvjezdica
  
end