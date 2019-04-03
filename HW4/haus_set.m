function [ d ] = haus_set(A,B)
%haus: hausdorff distance between sets
%   Detailed explanation goes here

    flag = 100;
    dmax= [];
    for x=0:10
    alpha = x*.1;
    levelSetA = levelset(alpha,A,flag);
    levelSetB = levelset(alpha,B,flag);
    ab = asym(levelSetA,levelSetB); 
    ba = asym(levelSetB,levelSetA);
    dtemp = max(ab,ba);
    dmax(x+1) = dtemp;
    end
    d = max(dmax);
    
end

