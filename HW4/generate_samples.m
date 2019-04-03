function [ res, classes ] = generate_samples( N, u1, u2 )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    res = cell(N,1);
    classes = zeros(N,1);
    
    for i=1:N
        ri = randi(4);
        ui = randi(2);
        if ui == 1
            u = u1;
            % Kmeans clasification starts at 1
            classes(i) = 1;
        else
            u = u2;
            classes(i) = 2;
        end
        
        if ri == 1
            res{i} = randn(1,1) + u;
        elseif ri == 2
            res{i} = sort(randn(1,2)) + u;
        elseif ri == 3
            res{i} = sort(randn(1,3)) + u;
        elseif ri == 4
            res{i} = sort(randn(1,4)) + u;
        end
    end

end

