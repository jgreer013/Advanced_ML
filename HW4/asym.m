function [ d ] = asym(A,B, flag)
%asym: asymmetric distance of A to B
%   Detailed explanation goes here

    a = rs(A,flag);
    b = rs(B,flag);
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

