function [ d ] = haus_int(A,B)
%hausdorff interval
%   Detailed explanation goes here
    d = max(abs(A(1) - B(1)), abs(A(2) - B(2)));
end

