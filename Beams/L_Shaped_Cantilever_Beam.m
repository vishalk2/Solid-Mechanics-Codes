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

%Method 2 for same problem
tan_2_theta = -2*Ixy/(Ix-Iy)
theta_1 = (1/2)*atan(tan_2_theta)
theta_2 = theta_1 - (pi/2)

%Moments of Inertia about Principal Axes
IX = Ix*(cos(theta_1)^2) + Iy*(cos(theta_2)^2) - 2*Ixy*sin(theta_1)*cos(theta_1)
IY = Ix + Iy - IX
phi_new = phi - theta_1

%Calculations
tan_alpha_prime = -IX*cot(phi_new)/IY
alpha_prime = atan(tan_alpha_prime)
alpha_new = alpha_prime + theta_1

%New Coordinates of points at which stresses are to be found out
XA = xA*cos(theta_1) + yA*sin(theta_1)
YA = yA*cos(theta_1) - xA*sin(theta_1)
XB = xB*cos(theta_1) + yB*sin(theta_1)
YB = yB*cos(theta_1) - xB*sin(theta_1)

%New Moments
MX = M*sin(phi_new)
MY = -M*cos(phi_new)

%Stress in "MPa"
sigma_A_new = ((MX*YA)/IX) - ((MY*XA)/IY)
sigma_B_new = ((MX*YB)/IX) - ((MY*XB)/IY)
