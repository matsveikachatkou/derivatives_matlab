clear all;
clc;

option_type = "C";
exercise_type = "A";
s0 = 42;
k  = 40;
r  = 0.1;
yield  = 0.3;
sig = 0.2;
mat = 0.5;
nsteps = 500;

optprice = my_binomial(option_type,exercise_type,r,s0,k,yield,mat,sig,nsteps)
