function [ d ] = haus_set(A,B)
%haus: hausdorff distance between sets
%   Detailed explanation goes here

    try
    flag = 100;
    %ab = asym(A,B);
    %ba = asym(B,A);
    dmax= [];
    for x=0:10
    alpha = x*.1;
    levelSetA = levelset(alpha,A,flag);
    levelSetB = levelset(alpha,B,flag);
    disp('print');
    ab = asym(levelSetA,levelSetB,flag); 
    ba = asym(levelSetB,levelSetA,flag);
    dtemp = max(ab,ba);
    dmax(x+1) = dtemp;
    end
    disp(dmax)
    d = max(dmax);
    catch
        disp(A)
        disp(B)
    end
    
end

