%I_Shaped Cantilever Beam
clear all; clc;
format long g

L = 2.5; %Length of the beam
P = 8000; %Load acting
phi = pi/2; %Angle between x-axis and plane of loads

%Body1 (Horizontal bottom)
b1 = 150;
t1 = 50;
A1 = b1*t1;

%Body2 (Horizontal Top)
b2 = 150;
t2 = 50;
A2 = b2*t2;

%Body3 (Vertical)
t3 = 50;
h3 = 250; %Includes t1 and t2
A3 = t3*(h3-t1-t2);

%Center of Mass calculation
A = A1 + A2 + A3;
x_0 = 0;
y_0 = (A1*(t1/2)+A2*(h3-(t2/2))+A3*(t1 + ((h3-t1-t2)/2)))/A

%Moment of Inertia
Ix1 = (1/12)*b1*(t1^3) + A1*((y_0 - (t1/2))^2);
Ix2 = (1/12)*b2*(t2^3) + A2*((h3-y_0-(t2/2))^2);
Ix3 = (1/12)*t3*((h3-t1-t2)^3) + A3*((t1 + ((h3-t1-t2)/2)-y_0)^2);
Ix = Ix1 + Ix2 + Ix3

Iy1 = (1/12)*t1*(b1^3);
Iy2 = (1/12)*t2*(b2^3);
Iy3 = (1/12)*(h3-t1-t2)*(t3^3);
Iy = Iy1 + Iy2 + Iy3

Ixy = 0

%Calculations
tan_alpha = (Ixy - Ix*cot(phi))/(Iy-Ixy*cot(phi)) %tan(alpha)
alpha = atan(tan_alpha) %Alpha value in radians

M = -P*L %Load acting at free end
Mx = M*sin(phi)
My = M*cos(phi)

%Points where stress is to be found
yA = h3 - y_0;
yB = (h3-t1-t2)/2;

%Stress in "Mpa"
sigma_A = (10^3)*abs(Mx)*yA/Ix
sigma_B = (10^3)*abs(Mx)*yB/Ix
