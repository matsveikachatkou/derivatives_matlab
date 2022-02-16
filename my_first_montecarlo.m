clear all;
close all;
clc;

s0 = 42;
k = 40;
r = 0.1;
q = 0;
sig = 0.2;
T = 0.5;

nsim = 1000000;
%z = normrnd(0,1,[nsim, 1]);
z = random("Normal", 0, 1, nsim, 1);
ln_sT = log(s0) + (r - q - 0.5 * sig ^ 2) * T + sig * sqrt(T) * z;
sT =exp(ln_sT);
payoff_d = exp(-r * T) * max(sT - k, 0);
c0 = mean(payoff_d);
display(c0);
subplot(2,1,1);

histogram(ln_sT)
subplot(2,1,2);
histogram(exp(ln_sT))

mean_z = mean(sig * sqrt(T) * z);
mean_st = mean(sT);
st_drift = s0 * exp(r*T);