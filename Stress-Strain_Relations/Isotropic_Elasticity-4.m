%Strain-Energy Density of Isotropic Materials
clear all; clc
format long

%Given Principal Strains
e_1 = 0;
e_2 = 0;
e_3 = 0;

%Strain Invariants
I1 = e_1 + e_2 + e_3
I2 = e_1*e_2 + e_1*e_3 + e_3*e_2
I3 = e_1*e_2*e_3

%Material Properties
E = 0; %Young's Modulus
v = 0; %Poisson's ratio

G = E/(2*(1+v)) %Shear Modulus or Lame's Coefficient
lambda = v*E/((1+v)*(1-2*v)) %Lame's Coefficient
K = E/(3*(1-2*v)) %Bulk Modulus

%Stress Invariants
I11 = I1*(2*G+3*lambda)
I22 = lambda*(3*lambda+4*G)*(I1^2) + 4*(G^2)*I2
I33 = (lambda^2)*(lambda+2*G)*(I1^3) + 4*lambda*(G^2)*I1*I2 + 8*(G^3)*I3

%Principal Stresses
sigma = roots([1,-I1,I2,-I3])
sigma(1)
sigma(2)
sigma(3)
