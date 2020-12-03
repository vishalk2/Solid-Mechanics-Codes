%Relations Between G,lambda,E, v and K
clear all; clc
format long g

%If E and v are given
E = 0; %Young's Modulus
v = 0; %Poisson's ratio

G = E/(2*(1+v)) %Shear Modulus or Lame's Coefficient
K = E/(3*(1-2*v)) %Bulk Modulus
lambda = 3*v*K/(1+v) %Lame's coefficient

%If lambda and G are given
G = 0;
lambda = 0;

E = G*(3*lambda+2*G)/(lambda+G)
v = lambda/(2*(lambda+G))
K = E/(3*(1-2*v))
