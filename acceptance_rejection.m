clear all;
close all;
clc;

% number of draws in a sample
ndraws = 10000;

% draw 3-dimensonal uniform
u = rand(ndraws, 3);

% sample from double exponential with inversion method
% for u sample, we assign -1 to those <0.5 and 1 to >0.5
x = -log(1 - u(:, 1)).* (2 * (u(:,2)>0.5)-1);

% compute constant 
c = sqrt(2 * exp(1) / pi);

% compute f(x) / c * g(x)
fcg = sqrt(2 / pi) * exp(-0.5 * x.^2 + abs(x));

% accept-reject
% create boolean
accept = (u(:,3) < fcg);
% draw sample
sample = x(accept);

% check what distribution we have
% ksdensity returns a probability density estimate
[g,si] = ksdensity(sample);
plot(si, g)
hold on 
y = normpdf(si);
plot(si,y)
hold off
