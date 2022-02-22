function W = Dist(A, sigma)
  
  [~, n] = size(A);
  W = zeros(n);
  
  for i = 1 : n
    for j = 1 : i
      W(i,j) = exp(-0.5 * norm(A(:,i)-A(:,j), 2)^2 / sigma^2);
      W(j,i) = W(i,j);
    end
  end
  
  %imagesc(W), colorbar;
   
end