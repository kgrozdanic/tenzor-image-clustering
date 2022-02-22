function dots = Generate1(m, k)
  
  % m = broj toèaka u clusteru
  % k = broj clusteru
  
  dots = zeros(2, m*k);
  a = 1; % razmjer toèaka istog clustera
  b = 10; % približna udaljenost izmeðu razlièitih clustera toèaka
  
  for i = 1 : k
    dots(1, (i-1)*m+1 : i*m) = a * randn(m,1) + b * (i-1);
    dots(2, (i-1)*m+1 : i*m) = a * randn(m,1) + b * (i-1);
  end
  
  dots = dots(:, randperm(m*k));  % nasumièna permutacija toèaka
  
  %figure();
  %plot(dots(1,:), dots(2,:), 'x');
  
end
