function X_z = Iter(X_tz, n, K)

%     disp(sprintf('..Started Iter.m'))
    % korak 4
    i = randi(n); 
    R(:,1) = X_tz(i, 1:K)'; 
    c = zeros(n, 1);
    for k = 2 : K
        c = c + abs(X_tz * R(:,k-1));
        [a, ind] = min(c);
        R(:,k) = X_tz(ind, 1:K)';
    end

    % korak 5
    phi_cz = 0;
    maxit = 1000;

    % koraci 6 - 8
    for iter = 1 : maxit

        X_t = X_tz * R; % X tilda
        X_z = zeros(n, k); % X zvjezdica
        for i = 1 : n
            [a, l] = max(X_t(i, 1:K));
            X_z(i, l) = 1;
        end

        [U, omega, U_t] = svd(X_z' * X_tz);
        phi_c = trace(omega);
        if abs(phi_c - phi_cz) < eps  % masinski epsilon
%             disp(sprintf('.. Converged after %d iters', iter))
            break;
        end
        phi_cz = phi_c;
        R = U_t * U'; 
    end
end