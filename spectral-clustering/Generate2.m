function dots = Generate2(m, rk, ck)
  
  % m = broj toèaka u clusteru
  % rk = broj redaka clustera
  % ck = broj stupaca clustera
  
  dots = zeros(2, m*rk*ck);
  a = 1; % razmjer toèaka istog clustera
  b1 = 5; % približna vodoravna udaljenost izmeðu razlièitih clustera toèaka
  b2 = 5; % približna okomita udaljenost izmeðu razlièitih clustera toèaka
  
  for i = 1 : rk
    for j = 1 : ck
      dots(1, (i-1)*ck*m + (j-1)*m + 1 : (i-1)*ck*m + (j-1)*m + m ) = a * randn(m,1) + b1 * (j-1);
      dots(2, (i-1)*ck*m + (j-1)*m + 1 : (i-1)*ck*m + (j-1)*m + m ) = a * randn(m,1) + b2 * (i-1);
    end
  end
  
  dots = dots(:, randperm(m*rk*ck)); % nasumièna permutacija toèaka
  
  %figure();
  %plot(dots(1,:), dots(2,:), 'x');
  
end
