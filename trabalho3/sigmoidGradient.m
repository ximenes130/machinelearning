function g = sigmoidGradient(z)
  %   g = SIGMOIDGRADIENT(z) calcula a derivada da função sigmoid no ponto z.
  
  g = sigmoid(z) .* (1 - sigmoid(z));
end
