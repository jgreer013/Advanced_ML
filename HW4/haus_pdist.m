function [ d2 ] = haus_pdist( Xi, Xj )
%Pdist formatting
%   Detailed explanation goes here
    m2 = size(Xj, 1);
    d2 = zeros(m2,1);
    for i=1:m2
        d2(i) = haus_set(Xi, Xj(i,:));
    end
end

