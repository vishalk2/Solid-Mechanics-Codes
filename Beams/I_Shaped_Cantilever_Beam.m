%I-Cantilever Beam with Moment of Inertia Given
clear all; clc;
format long g

L = 3; %Length of the beam
Ix = 56.43*(10^6);
Iy = 18.11*(10^6);
Ixy = 22.72*(10^6);
Y = 300*(10^6); %Yield Stress
E = 200*(10^9); %Young's Modulus
phi = pi/3;

%Point where stress is to be calculated
xA = -91;
yA = -120;

%Calculations
tan_alpha = (Ixy - Ix*cot(phi))/(Iy - Ixy*cot(phi))
alpha = atan(tan_alpha) %Alpha in radians

P = (10^(-9))*Y*(Ix - Ixy*tan_alpha)/((yA - xA*tan_alpha)*(-L*sin(phi)))

v = (10^(15))*P*(L^3)*sin(phi)/((3*E)*(Ix - Ixy*tan_alpha))
u = -v*tan_alpha

delta = ((u^2) + (v^2))^(0.5) %Total displacement of free end
