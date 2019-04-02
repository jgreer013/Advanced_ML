function [ mat ] = pad_mat( data, M, flag )
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here
    mat = ones(size(data,1),M)*flag;
    for i=1:size(data,1)
        mat(i,1:size(data{i},2)) = data{i};
    end
end

