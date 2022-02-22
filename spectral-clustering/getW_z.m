function W_z = getW_z(W, k)  
    n = length(W);
    W_z = zeros(n);
    
    for i = 1 : n
        temp = W(i, :);
        mini = min(temp);
        indx = find(temp > mini);
        not_mini = temp(indx);
        [~, I] = sort(not_mini, 'descend');
                
        W_z( i, indx( I(1:k)) ) = 1;

    end
    
    W_z = W_z | W_z';
     
end