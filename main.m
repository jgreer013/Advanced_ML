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
end

%% Get Kernel Matrix

K = zeros(m,m);
for i=1:m
    f1 = doc_term(i,:);
    for j=1:m
        f2 = doc_term(j,:);
        K(i,j) = dot(f1,f2);
    end
end

%% Optional: Normalize K

for i=1:m
    for j=1:m
        K(i,j) = K(i,j)/(K(i,i)*K(j,j));
    end
end

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

%% 



