%L-Shaped Cantilever Beam
clear all; clc
format long g

L = 5; %Length of the beam
a = 2; %Distance of one end of beam from point of loading
b = 3; %Distance of another end of beam from point of loading
P = 4000; %Load acting
phi = (2/3)*pi; %Angle between x-axis and plane of loads

%Body1 (Vertical)
t1 = 10;
h = 120; %This includes t1 also
A1 = h*t1;

%Body2 (Horizontal)
b2 = 80;
t2 = 10;
A2 = (b2-t1)*t2;

%Center of Mass Location
A = A1 + A2
x_0 = (A1*(t1/2) + A2*((b2+t1)/2))/A
y_0 = (A1*(h/2) + A2*(t2/2))/A

%Moment of Inertia
Ix1 = (1/12)*t1*(h^3) + A1*(((h/2)-y_0)^2);
Ix2 = (1/12)*(b2-t1)*(t2^3) + A2*((y_0-(t2/2))^2);
Ix = Ix1 + Ix2

Iy1 = (1/12)*h*(t1^3) + A1*((x_0-(t1/2))^2);
Iy2 = (1/12)*t2*((b2-t1)^3) + A2*((((b2+t1)/2)-x_0)^2);
Iy = Iy1 + Iy2

Ixy1 = A1*(x_0 - (t1/2))*(y_0 - h/2);
Ixy2 = A2*(y_0 - (t2/2))*(x_0 - (b2+t1)/2);
Ixy = Ixy1 + Ixy2

%Calculations
tan_alpha = (Ixy - Ix*cot(phi))/(Iy - Ixy*cot(phi))
alpha = atan(tan_alpha)

M = P*a*b/L
Mx = M*sin(phi)
My = -M*cos(phi)

%Points where Stress is to be calculated
xA = x_0 - b2;
yA = y_0;
xB = x_0;
yB = y_0 - h;

%Stress in "MPa"
sigma_A = 1000*Mx*(yA - xA*tan_alpha)/(Ix - Ixy*tan_alpha)
sigma_B = 1000*Mx*(yB - xB*tan_alpha)/(Ix - Ixy*tan_alpha)
