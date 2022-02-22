function dots = Generate1(m, k)
  
  % m = broj to�aka u clusteru
  % k = broj clusteru
  
  dots = zeros(2, m*k);
  a = 1; % razmjer to�aka istog clustera
  b = 10; % pribli�na udaljenost izme�u razli�itih clustera to�aka
  
  for i = 1 : k
    dots(1, (i-1)*m+1 : i*m) = a * randn(m,1) + b * (i-1);
    dots(2, (i-1)*m+1 : i*m) = a * randn(m,1) + b * (i-1);
  end
  
  dots = dots(:, randperm(m*k));  % nasumi�na permutacija to�aka
  
  %figure();
  %plot(dots(1,:), dots(2,:), 'x');
  
end
