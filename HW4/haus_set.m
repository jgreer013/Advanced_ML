function [ d ] = haus_set(A,B)
%haus: hausdorff distance between sets
%   Detailed explanation goes here

    
    %ab = asym(A,B);
    %ba = asym(B,A);
    dmax= [];
    for x=0:10
    alpha = x*.1;
    levelSetA = levelset(alpha,A);
    levelSetB = levelset(alpha,B);
    ab = asym(levelSetA,levelSetB); 
    ba = asym(levelSetB,levelSetA);
    dtemp = max(ab,ba);
    dmax(x+1) = dtemp;
    end
    disp(dmax)
    d = max(dmax);
    
    
end

