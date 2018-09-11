# Função que calcula gradientes descendentes
#
# Dica:
#   A função do gradiente descendente, deve receber como parâmetros a matriz 
#   de dados de entrada X, o vetor de valores alvo y, o vetor de valores iniciais 
#   dos parâmetros ?, o valor da taxa de aprendizagem a e o número total de 
#   iterações. Não é necessário criar critérios de convergência para o algoritmo. 
#   Essa função deve retornar, obrigatoriamente, o vetor de parâmetros ? com os 
#   valores ótimos, ajustados ao conjunto de dados de treinamento. Sugere-se, 
#   também, retornar um vetor de valores da função custo para cada iteração.

function [theta] = descending_gradient(X, y, initial_theta, alpha, iterations)
  m = length(y);
  theta_lenght = length(initial_theta);
  temp_theta = theta = initial_theta;
  
  for iteration = (1:iterations)
    h = theta(1) .* X(:,1) + theta(2) .* X(:,2) + theta(3) .* X(:,3);
    
    temp_theta(1)  =  theta(1) - alpha * (1/m) * sum(h - y);
    for j = (2:theta_lenght)
      temp_theta(j) = theta(j) - alpha * (1/m) * sum((h - y) * X(j));
    endfor
    theta = temp_theta;
    
    # Disponibilizando o custo por motivo de debug
    disp(cost(X, y, theta));
  endfor
end