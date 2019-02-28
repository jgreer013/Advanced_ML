%% Part 1

%% Load Data

clear;
clear all;
close all;
clc;

f = fopen('files.txt','r');
files = textscan(f, '%s');
files = files{1};
fclose(f);

m = length(files);
all = {};
for k=1:m
    fn=strcat('exmp/',files{k});
    f = fopen(fn, 'r');
    fileData(k) = textscan(f, '%s');
    fclose(f);
    all = vertcat(all, fileData{k});
end

stops = {}; %Stop words go here
t_to_id = containers.Map;
for i=1:length(all)
    term = all{i};
    if ~any(strcmp(stops, term))
        t_to_id(term) = 1;
    end
end

id_to_t = keys(t_to_id);
for i=1:length(id_to_t)
    term = id_to_t{i};
    t_to_id(term) = i;
end

n = length(id_to_t);

%% Convert terms to ids and build matrix of frequencies

doc_term = zeros(m, n);

for i=1:m
    file = fileData{i};
    for j=1:length(file)
        term = file{j};
        id = t_to_id(term);
        doc_term(i,id) = doc_term(i,id) + 1;
    end
    doc_term(i,:) = doc_term(i,:)/sum(doc_term(i,:));
end

%% Get Kernel Matrix

% Kernel seems to just be the dot products of the
% frequency vectors of each document
K = zeros(m,m);
for i=1:m
    f1 = doc_term(i,:);
    for j=1:m
        f2 = doc_term(j,:);
        K(i,j) = f1 * f2';
    end
end

%% Optional: Normalize K

%for i=1:m
%    for j=1:m
%        K(i,j) = K(i,j)/(K(i,i)*K(j,j));
%    end
%end

%% Spectral Clustering

y_true = [1 1 1 1 1 2 2 2 2 3 3 3 3 4 4 4 4 5 5 5 6 6 7 7 8 9 10];

[vecs, eigs] = eig(K);
mx_val = 1;
y = vecs(:,1);
for i=2:m
    val = eigs(i,i);
    if val > mx_val
        mx_val = val;
        y = vecs(:,i);
    end
end

y_t = y;
mn = mean(y_t);
for i=1:length(y_t)
    if y_t(i) >= mn
        y_t(i) = 1;
    else
        y_t(i) = 0;
    end
end

%% 3 Clusters

% Note: N = number of clusters
% L = number of data points
% Capital lambda is the diagonal eigenvalue matrix

N = 4;
V_N = vecs(:,1:N);
r_lambda = sqrtm(eigs);
W = (V_N'*r_lambda)';

A = W;
for i=1:size(W,1)
    mx = W(i,1);
    mx_j = 1;
    A(i,1) = 0;
    for j=1:size(W,2)
        A(i,j) = 0;
        if W(i,j) > mx
            mx = W(i,j);
            mx_j = j;
        end
    end
    A(i,mx_j) = 1;
end
    
A = real(A);
clusts = zeros(size(A,1),1);
for i=1:size(A,1)
    clusts(i) = find(A(i,:)==1);
end

silhouette(doc_term, clusts)
% Dimensionality of V_N?

% What on earth is Capital Lambda? Never mentioned in notes
% Can't find consistent Linear Algebra meaning



