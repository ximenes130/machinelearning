clear;

function plotData(x,y)
  plot(x,y,'r*','MarkerSize',8); % Plot the data
end

y = [53 60 56 79 58 85 70 56 69 76 79 68 74 72 84 78 76 65 92 80 65]';
x = [6 7 6.5 8 6.6 8.1 6.8 6.9 7.3 6.9 8.2 7.2 7.3 6.9 8.6 7.4 7.6 6.8 8 7.4 6.5]';

X = [ones(length(x), 1) x];
theta = [0;10];
J = calc_reg(X, y, theta);

t = 0:0.1:10
h = theta(1) + theta(2) .* t

% Plot train data
plotData(x,y);
xlabel('Horas estudadas'); % Set the x-axis label
ylabel('Nota obtida'); % Set the y-axis label

# Plot the fitted equation we got from the regression
hold on;
# plot(X(:,2), X*theta, '-')
plot(t, h, '-');
hold off 

save('reg_linear.mat')
fprintf('Press enter to continue.\n');
pause;
