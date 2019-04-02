%% Clear Data

clear all;
close all;
clc;
rng(1);

%% Part 1: Generate Data

N = 100;
M = 4;
[data, labels] = generate_samples(N);

%% Part 2: Generate Embeddings

embeds = embed(data, N);

matEmbed = cell2mat(embeds);

dmat = pad_mat(data, M, 100);

kmeanRes = kmedoids(dmat,2,'Distance',@haus_pdist);

%Assuming mathlab commands

figure;
silhouette(dmat,kmeanRes)
%labelsSil = silhouette(matEmbed,labels)


