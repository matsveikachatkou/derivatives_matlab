clear all;
clc;

S = 100;        % current stock price (spot price)
K = 95;         % exercise price (strike price)
sigma = 0.50;   % volatility of stock
T = 3/12;       % expiry time in years
r = 0.01;
q = 0;

[price_call, delta_call, gamma_call, vega_call, theta_call] = my_Black_Scholes(S, K, r, q, T, sigma, "Call");
[price_put, delta_put, gamma_put, vega_put, theta_put]  = my_Black_Scholes(S, K, r, q, T, sigma, "Put");
disp("   Price     Delta     Gamma     Vega     Theta");
disp("   Call");
disp([price_call, delta_call, gamma_call, vega_call, theta_call]);
disp("   Put");
disp([price_put, delta_put, gamma_put, vega_put, theta_put]);