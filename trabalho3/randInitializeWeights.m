function W = randInitializeWeights(L_in, L_out)
%   W = RANDINITIALIZEWEIGHTS(L_in, L_out) inicia aleatoriamente os pesos
%   de uma matriz com uma camada de entrada de L_in neurônios de entrada
%   e L_out de saída.
%
%   Repare que W deve ser uma matriz de tamanho (L_out, 1 + L_in) considerando
%   que a primeira coluna é referente ao neurônio de bias.
%

W = zeros(L_out, 1 + L_in);

epsilon_init = 0.12;
W = rand(L_out, 1 + L_in) * (2 * epsilon_init) - epsilon_init;

% =========================================================================

end
