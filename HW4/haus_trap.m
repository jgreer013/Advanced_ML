function [ d ] = haus_trap(A,B)
%hausdorff trapezoidal fuzzy sets
%   Detailed explanation goes here
    alpha = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
    mxs = zeros(size(alpha, 1));
    for ai = 1:size(alpha,1)
        a = alpha(ai);
        L1 = abs((A(1) + a*(A(2)-A(1))) - (B(1) + a*(B(2)-B(1))));
        L2 = abs((A(4) - a*(A(4)-A(3))) - (B(4) - a*(B(4)-B(3))));
        mxs(ai) = max(L1, L2);
    end
    d = max(mxs);
end

