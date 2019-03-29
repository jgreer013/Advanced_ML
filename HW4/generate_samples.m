function [ res, classes ] = generate_samples( N )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    res = cell(N,1);
    u1 = -5;
    u2 = 5;
    classes = zeros(N,1);
    
    for i=1:N
        ri = randi(4);
        ui = randi(2);
        if ui == 1
            u = u1;
            classes(i) = 0;
        else
            u = u2;
            classes(i) = 1;
        end
        
        if ri == 1
            res{i} = randn(1,1) + u;
        elseif ri == 2
            res{i} = sort(randn(2,1)) + u;
        elseif ri == 3
            res{i} = sort(randn(3,1)) + u;
        elseif ri == 4
            res{i} = sort(randn(4,1)) + u;
        end
    end

end

