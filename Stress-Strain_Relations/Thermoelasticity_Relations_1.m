%Thermoelasticity Relations for Isotropic Materials
clear all; clc
format long g

%Strain Components at Point 0
e_xx = 0;
e_yy = 0;
e_zz = 0;
e_xy = 0;
e_yz = 0;
e_xz = 0;
e = e_xx + e_yy + e_zz;
I1 = e;
I2 = e_xx*e_yy + e_yy*e_zz + e_xx*e_zz - e_xy^2 - e_yz^2 - e_xz^2;


%Material Properties
E = 0; %Young's Modulus
v = 0; %Poisson's ratio
alpha = 0; %Coefficient of Thermal Expansion of material
delta_T = 0; %Change in Temperature

G = E/(2*(1+v)) %Shear Modulus or Lame's Coefficient
lambda = v*E/((1+v)*(1-2*v)) %Lame's Coefficient
K = E/(3*(1-2*v)) %Bulk Modulus
c = alpha*(3*lambda+2*G)

%Strain Components after a temperature change
e_XX = e_xx - alpha*delta_T
e_YY = e_yy - alpha*delta_T
e_ZZ = e_zz - alpha*delta_T
e_XY = e_xy
e_YZ = e_yz
e_XZ = e_xz

%Stresses
sigma_xx = lambda*e + 2*G*e_xx - c*delta_T
sigma_yy = lambda*e + 2*G*e_yy - c*delta_T
sigma_zz = lambda*e + 2*G*e_zz - c*delta_T
sigma_xy = 2*G*e_xy
sigma_yz = 2*G*e_yz
sigma_xz = 2*G*e_xz

%Strain-Energy Density
U0 = (0.5*lambda+G)*(I1^2)-2*G*I2-c*I1*delta_T+(3/2)*c*alpha*(delta_T^2)
