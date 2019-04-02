%% Clear Data

clear all;
close all;
clc;

%% Part 1: Generate Data

N = 100;
[data, labels] = generate_samples(N);

%% Part 2: Generate Embeddings

embeds = embed(data, N);
matEmbed = [embeds{:,:}]';
kmeanRes = kmeans(matEmbed,2);

%Assuming mathlab commands

%kmeansSil = silhouette(matEmbed,kmeansRes)
%labelsSil = silhouette(matEmbed,labels)



