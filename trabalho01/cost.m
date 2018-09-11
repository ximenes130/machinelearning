# Função que calcula o custo da regressão linear
#
# Dica:
#   A função custo deve receber como parâmetros a matriz de dados de entrada X,
#   o vetor de valores alvo y (lembrando que a regressão linear é um algoritmo 
#   de treinamento supervisionado) e o vetor de parâmetros ?. Para facilitar, e 
#   agilizar, o cálculo da função custo, é sugerido o uso de operações algébricas 
#   no lugar de loops de repetição, como o for. Por isso, a matriz X deve conter 
#   uma coluna adicional na primeira posição, formada somente pelo valor 1. O nome 
#   do arquivo deve ser o mesmo nome da função, acrescida da extensão .m.

function [J] = cost(X, y, theta)
  m = length(y);
  J = sum((X * theta - y))./ (2 * m)
end