function [A, eigvalue_A] = sort_by_eig(A, eigvalue_A)
    eigvalue_A = diag(eigvalue_A);
    [~, index] = sort(-abs(eigvalue_A));
    A = A(:, index);
    
    for i = 1:size(A,2)
        A(:,i) = A(:,i) ./ norm(A(:,i));
    end
end
