function [ d ] = asym(A,B)
%asym: asymmetric distance of A to B
%   Detailed explanation goes here

    a = size(A,1);
    b = size(B,1);
    supr = zeros(a,1);
    for xi = 1:a
        di = zeros(b,1);
        for yi = 1:b
            di(yi) = dist(A(xi), B(yi));
        end
        supr(xi) = min(di);
    end
    d = max(supr);
end

