%U-Shaped Cantilever Beam
clear all; clc;
format long g

L = 3; %Length of the beam
P = 12000; %Load Acting
phi = pi/3; %Angle between x-axis and plane of loads

%Body1 (Vertical)
h1 = 200;
tf1 = 20;
A1 = h1*tf1;

%Body2 (Vertical)
h2 = 200;
tf2 = 20;
A2 = tf2*h2;

%Body3 (Horizontal)
b = 140;
tw = 20;
A3 = tw*(b-tf1-tf2);

%Center of Mass Location
A = A1 + A2 + A3; %Total Area
x_0 = 0
y_0 = (A1*h1 + A2*h2 + A3*tw)/(2*A)

%Moment Of Inertia (in mm^4)
Ix1 = (1/12)*tf1*(h1^3) + A1*(((h1/2)-y_0)^2);
Ix2 = (1/12)*tf2*(h2^3) + A2*(((h2/2)-y_0)^2);
Ix3 = (1/12)*(b-tf1-tf2)*(tw^3) + A3*((y_0-(tw/2))^2);
Ix = Ix1 + Ix2 + Ix3

Iy1 = (1/12)*h1*(tf1^3) + A1*(((b-tf1)/2)^2);
Iy2 = (1/12)*h2*(tf2^3) + A2*(((b-tf2)/2)^2);
Iy3 = (1/12)*tw*((b-tf1-tf2)^3);
Iy = Iy1 + Iy2 + Iy3

Ixy = 0

%Calculations
tan_alpha = (Ixy - Ix*cot(phi))/(Iy-Ixy*cot(phi)) %tan(alpha)
alpha = atan(tan_alpha) %Alpha value in radians

M = -L*P %Moment in 'Nm'
%Moment = L*P only if P acts at free end
%If P acts somewhere in between the Beam
%Then Use M = P*a*b/L
Mx = M*sin(phi)
My = -M*cos(phi)

%Points where Stress is to be calculated
yA = -(h1-y_0);
xA = -b/2;
yB = y_0;
xB = b/2;

%Stress (in MPa)
sigma_A = 1000*Mx*(yA - xA*tan_alpha)/(Ix - Ixy*tan_alpha)
sigma_B = 1000*Mx*(yB - xB*tan_alpha)/(Ix - Ixy*tan_alpha)
