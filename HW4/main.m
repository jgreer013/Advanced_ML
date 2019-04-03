%% Clear Data

clear all;
close all;
clc;

%% Part 1: Generate Data

N = 200;
M = 4;
u1 = -5;
u2 = 5;
[data, labels] = generate_samples(N, u1, u2);

%% Part 2: Generate Embeddings

embeds = embed(data, N);

matEmbed = cell2mat(embeds);

dmat = pad_mat(data, M, 100);

kmeanRes = kmedoids(dmat,2,'Distance',@haus_pdist);
kmed_embed = kmedoids(matEmbed, 2);

eq = sum(kmeanRes==labels)/N;
acc = max(eq, 1 - eq);
disp('Hausdorff accuracy');
disp(acc)

eq_em = sum(kmed_embed==labels)/N;
acc_em = max(eq_em, 1 - eq_em);
disp('Embed accuracy');
disp(acc_em);

%Assuming mathlab commands

figure;
subplot(1,2,1);
silhouette(dmat,kmeanRes,@haus_pdist);
title('Hausdorff');
subplot(1,2,2);
silhouette(matEmbed, kmed_embed);
title('Embeddings');

%% Closer data

u3 = -1;
u4 = 1;
N2 = 200;
[data, labels] = generate_samples(N2, u3, u4);

%% 

embeds = embed(data, N2);

matEmbed = cell2mat(embeds);

dmat = pad_mat(data, M, 100);

kmeanRes = kmedoids(dmat,2,'Distance',@haus_pdist);
kmed_embed = kmedoids(matEmbed, 2);

eq = sum(kmeanRes==labels)/N2;
acc = max(eq, 1 - eq);
disp('Hausdorff accuracy');
disp(acc)

eq_em = sum(kmed_embed==labels)/N2;
acc_em = max(eq_em, 1 - eq_em);
disp('Embed accuracy');
disp(acc_em);

%Assuming mathlab commands

figure;
subplot(1,2,1);
silhouette(dmat,kmeanRes,@haus_pdist);
title('Hausdorff');
subplot(1,2,2);
silhouette(matEmbed, kmed_embed);
title('Embeddings');
