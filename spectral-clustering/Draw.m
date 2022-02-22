function [] = Draw(X, A, s)
  % s je samo string za naslov da se zna koja je metoda
  [~, k] = size(X);

  
  figure()
  title(s)
  xlabel('x koordinata')
  ylabel('y koordinata')
 
  cmap = hsv(k) * 0.8 + turbo(k) * 0.2;

    
  hold on;
  
  % ispisujte korak po korak da skuzite kako radi
  [f, c] = find(X);
  pocetak = 1;
  
  for i = 1 : k
    korak = length(find(c==i));
    ind = f(pocetak : pocetak + korak - 1);
    pocetak = pocetak + korak;
    plot (A(1, ind), A(2, ind), 'linestyle', 'none', 'Marker', '.', 'MarkerSize', 11, 'Color', cmap(i, :))
  end
  
  ax1 = gca;
  grid on; box on;
  
  set(ax1, 'Color',[1 1 0.99],'gridcolor', [0 0 0], 'gridalpha', 0.23 ,'LineWidth', 1);

   
  
  %imagesc(X), colorbar;
 


end
