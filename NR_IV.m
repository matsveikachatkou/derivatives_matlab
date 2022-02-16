function [sigma, abs_fv, iter] = NR_IV(S_0, K, r, q, T, C, type)
% function returns implied volatility and absolute difference

% tolerance
epsilon = 1E-07;
% starting value of volatility
sigma = 0.6;
% price calculated by BS
[price,~,~,~,~] = my_Black_Scholes(S_0, K, r, q, T, sigma, type);
% starting value of the function
fv = C - price;
% absolute value of the function
abs_fv = abs(fv);
% max number of iterations
max_iter = 200;
% realized number of iterations
iter = 0;

while (abs_fv > epsilon) && (max_iter > iter)
    % define 1st derivative of the function
    [~,~,~,vega,~] = my_Black_Scholes(S_0, K, r, q, T, sigma, type);
    derivative = -vega;
    % new volatility
    sigma = sigma - (fv/derivative);
    % new price
    [price,~,~,~,~] = my_Black_Scholes(S_0, K, r, q, T, sigma, type);
    % new fv and abs_fv
    fv = C - price;
    abs_fv = abs(fv);
    iter = iter + 1;
end