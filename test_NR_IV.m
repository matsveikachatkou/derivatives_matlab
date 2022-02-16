clear all;
clc;

S = 42;        
K = 40;        
T = 0.5;       
r = 0.1;
q = 0;
C = 4.76;

[sigma, abs_fv, iter] = NR_IV(S, K, r, q, T, C, "Put");
display([sigma, abs_fv, iter]);