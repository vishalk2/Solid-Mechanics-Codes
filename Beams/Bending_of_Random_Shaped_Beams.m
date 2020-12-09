%Bending of Beams
clear all; clc
format long g

%Given Moment of Inertia
Ix = 0;
Iy = 0;
Ixy = 0;
phi = 2*pi;
P = 0; %Load in kN
L = 3; %Length of the beam

%Calculations
tan_alpha = (Ixy-Ix*cot(phi))/(Iy-Ixy*cot(phi))
alpha = atan(tan_alpha) %Orientation of neutral axis with x-axis

M = P*L %Bending Moment
Mx = M*sin(phi)
My = M*cos(phi)

%Coordinates of points where Potential Tension
%and Compression can occur

%Point for Tension(keep notice of signs of coordinates)
xA = 0;
yA = 0;

%Point for Compression(keep notice of signs of coordinates)
xB = 0;
yB = 0;

%Stresses
sigma_Tension = Mx*(yA-xA*tan_alpha)/(Ix-Ixy*tan_alpha)
sigma_Compression = Mx*(yB-xB*tan_alpha)/(Ix-Ixy*tan_alpha)

%Deflections
v = P*(L^3)/(3*E*(Ix-Ixy*tan_alpha)) %y-component of deflection
u = -v*tan_alpha %x-component of deflection
delta = norm([v,u]) %Total maximum deflection
