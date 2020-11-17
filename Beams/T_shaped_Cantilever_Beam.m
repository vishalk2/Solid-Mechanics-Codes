%T-Shaped Cantilever Beam with only a Point load acting
clear all; clc;
format long g

L = 6.1; %Length of the beam
Tau_max = 165*(10^6);
phi = (2/3)*pi;

%Body1 (Horizontal)
b = 200;
t1 = 6.25;
A1 = b*t1;

%Body2 (Vertical)
h = 300; %This includes t1 also
t2 = 6.25;
A2 = (h-t1)*t2;

%Center of Mass location
A = A1 + A2
x_0 = 0
y_0 = (A1*(h-(t1/2)) + A2*((h-t1)/2))/A

%Moment of Inertia
Ix1 = (1/12)*b*(t1^3) + A1*((h-(t1/2) - y_0)^2);
Ix2 = (1/12)*t2*((h-t1)^3) + A2*((((h-t1)/2) - y_0)^2);
Ix = Ix1 + Ix2

Iy1 = (1/12)*t1*(b^3);
Iy2 = (1/12)*(h-t1)*(t2^3);
Iy = Iy1 + Iy2

Ixy = 0

%Calculations
Mx = -L*sin(phi);
My = L*cos(phi);

%Points at which stress could be max
xA = b/2;
yA = y_0 - h;
xB = -b/2;
yB = y_0 - h;
xC = -t2/2;
yC = y_0;

%Stress is actually function of P
%So finding max coefficient of P and then multiplying with P
%And applying Tresca Criterion with Tau_max
sigma_A = (((Mx*yA)/Ix) - ((My*xA)/Iy))*(10^9)
sigma_B = (((Mx*yB)/Ix) - ((My*xB)/Iy))*(10^9)
sigma_C = (((Mx*yC)/Ix) - ((My*xC)/Iy))*(10^9)

%Finding max Coefficient
sigma = abs(max([sigma_A,sigma_B,sigma_C]))

syms P
eqn = P*sigma/2 == Tau_max;
P = double(solve(eqn,P))
