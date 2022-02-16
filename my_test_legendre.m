clear all;
clc;

[x, w] = GaussLegendre(5);
a = 0;
b = pi / 2;
t = ((b - a) / 2) * x + ((a + b) / 2);

result = ((b - a) / 2) * sum(w .* sin(t));

difference = 1 - result;
display(difference);