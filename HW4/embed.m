function [ new_data ] = embed( data, N )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    new_data = cell(size(data));
    for i=1:N
        x = data{i};
        s = size(x,2);
        if s == 4
            new_data{i} = x;
        elseif s == 3
            nd = ones(1,4)*x(2);
            nd(4) = x(3);
            nd(1) = x(1);
            new_data{i} = nd;
        elseif s == 2
            nd = ones(1,4)*x(1);
            nd(3) = x(2);
            nd(4) = x(2);
            new_data{i} = nd;
        elseif s == 1
            new_data{i} = ones(1,4)*x;
        end
    end
end

