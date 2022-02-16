function [Price, Delta, Gamma, Vega, Theta] = my_Black_Scholes(S_0, K, r, q, T, sigma, type)

% function calculates the price of European options 

d_plus = (log(S_0 / K) + (r - q + 0.5 * sigma^2) * T) / (sigma * sqrt(T));
d_minus = (log(S_0 / K) + (r - q - 0.5 * sigma^2) * T) / (sigma * sqrt(T));

if type == "Call"
    phi = 1;
    Price = S_0 * exp(-q * T) * normcdf(d_plus) - K * exp(-r * T) * normcdf(d_minus); 
    
elseif type == "Put"
    phi = -1;
    Price = K * exp(-r * T) * normcdf(-d_minus) - S_0 * exp(-q * T) * normcdf(-d_plus);
else
    disp("type either Put or Call!")
end

Delta = phi * exp(-q * T) * normcdf(phi * d_plus);
Gamma = exp(-q * T) * normpdf(d_plus) / (S_0 * sigma * sqrt(T));
Vega = exp(-q * T) * normpdf(d_plus) * S_0 * sqrt(T);
Theta = -exp(-q * T) * S_0 * normpdf(d_plus) * sigma / (2 * sqrt(T)) + phi * ( ...
        -r * K * exp(-r * T) * normcdf(phi * d_minus) + q * S_0 * exp(-q * T) * normcdf(phi * d_plus));
end
