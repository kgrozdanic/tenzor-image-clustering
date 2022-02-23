function ApplyNormCut(S, k, y)
    X_z = NC(S, k);
    [~, idx] = find(X_z);
    idx = idx - 1;
    [acc, ~, ~] = AccMeasure(y, idx);
    disp(acc);
end