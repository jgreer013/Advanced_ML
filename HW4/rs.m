function [ s ] = rs(point, flag)
%Custom size function since matlab doesn't let you cluster using cell
%arrays
%   Detailed explanation goes here
    s = 4;
    for i=1:4
        if point(i) == flag
            s = i-1;
            break;
        end
    end
end

