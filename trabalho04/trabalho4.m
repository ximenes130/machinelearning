%TRABALHO4.m implementa a classificacao para automoveis de passeio movidos a
%gasolina utilizando como algoritmo principal o K-means
%
% Apos realizar a classificacao, o valor medio de consumo e emissao de carbono
% de cada classe será exibido.
%
% A quantidade de classes definida foi definida como 5 por meio da analize
% do grafico de Cotovelo. Metodo que consiste na analise de um gráfico contendo
% as distancias dos pontos até sua classe. 
%
% Obs: Para ativar o calculo da variancia basta editar as variaveis 'maxClusters'
%      e 'minClusters' para que seja calculada mais de uma variancia

clear ; close all; clc

% Carregando base de dados
load('data.mat');

% Inicializando variaveis
X           = [millage, carbon];
len         = size(X, 1);
maxClusters = 5;
minClusters = 5;
maxIter     = 15;
index       = 0;
V           = [];

% Loop para valculo das variancias medias entre as quantidades de clusteres
for qtdClusters = minClusters:maxClusters
  printf('Iteração da qtdClusters... %d de %d\n', qtdClusters, maxClusters)

  % Selecionando valores aleatorios para os centroides iniciais
  k = randperm(len);
  k = k(1:qtdClusters);
  K = X(k,:);

  % Rodando o K-means
  for i = 1:maxIter
    printf('\tIteração do K-means... %d de %d\n', i, maxIter)

    % Definindo o centroide mais próximo de cada X
    indexes = assignCentroids(X, K);
    
    % Computando novos centroides
    K = updateCentroids(X, K, indexes);

    % Pulando plot de dados quando estiver calculando a variancia para acelerar
    % o processo
    if minClusters >= maxClusters
      % Plotando dados
      plotData(K, X, indexes);
    end
  end

  % Calculando variancia
  V = [V, calcVariance(X, K, indexes)];
end

% Plotando variancias quando houver calculo de multiplas variancias
if minClusters < maxClusters
  plot(V);
end

printMatrix = [(65:(size(K)+64))', sortrows(K, 2)];
printf('\n\nA quantidade média de milhagem e consumo para cada classe identificada é: \n\n');
printf('Classe | Milhagem | Carbono\n----------------------------\n');
printf('   %c   |  %2.2f   |  %2.2f\n', printMatrix');
