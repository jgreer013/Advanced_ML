function [ d ] = haus_tri(A,B)
%hausdorff triangular fuzzy sets
%   Detailed explanation goes here
    alpha = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
    mxs = zeros(size(alpha, 1));
    for ai = 1:size(alpha,1)
        a = alpha(ai);
        L1 = abs((1-a)*(A(1)-B(1)) + a*(A(2)-B(2)));
        L2 = abs((1-a)*(A(3)-B(3)) + a*(A(2)-B(2)));
        mxs(ai) = max(L1, L2);
    end
    d = max(mxs);
end

