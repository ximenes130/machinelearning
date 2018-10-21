clear; clc;

load('data.mat');
m = size(X, 1);

% Escolhe aleatoriamente 100 imagens para visualização
rand_indices = randperm(m);
sel = X(rand_indices(1:100), :);

displayData(sel);

%% Insira a partir daqui o seu código
