%Circumferential Stresses in a Curved Beam
clear all; clc
format long g

%Known or Given Parameters
N = 120000
Mx = N*364
A = 8640
Am = 77.93
R = 124

%Substitute value for "r" for finding
%Circumferential Stress in MPa at that point
rB = 72
sigma_at_B = (N/A)+((Mx*(A-rB*Am))/(A*rB*(R*Am-A)))

rC = 240
sigma_at_C = (N/A)+((Mx*(A-rC*Am))/(A*rC*(R*Am-A)))

%Distance of Neutral Axis
Rn = A*Mx/(Am*Mx+N*(A-R*Am))

%Radial Stress
t = 24 %Thickness of cross section
r = 120 %Radius from center of curvature
A_prime = 48*120
Am_prime = 61.30

sigma_rr = (A*Am_prime-A_prime*Am)*Mx/(t*r*A*(R*Am-A))
