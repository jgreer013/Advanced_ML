function [ d ] = haus_set(A,B)
%haus: hausdorff distance between sets
%   Detailed explanation goes here
    ab = asym(A,B);
    ba = asym(B,A);
    d = max(ab,ba);
end

