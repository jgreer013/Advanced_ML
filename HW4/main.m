%% Clear Data

clear all;
close all;
clc;

%% Part 1: Generate Data

N = 100;
M = 4;
[data, labels] = generate_samples(N);

%% Part 2: Generate Embeddings

embeds = embed(data, N);

matEmbed = cell2mat(embeds);

dmat = pad_mat(data, M, 100);

for i=1:N
    for j=1:N
        haus_set(dmat(i,:),dmat(j,:));
    end
end


%kmeanRes = kmedoids(dmat,2,'Distance',@haus_set);

%Assuming mathlab commands

figure;
silhouette(matEmbed,kmeanRes)
%labelsSil = silhouette(matEmbed,labels)


