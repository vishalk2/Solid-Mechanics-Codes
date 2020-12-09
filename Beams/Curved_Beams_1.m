%Circumferential Stresses in a Curved Beam
clear all; clc
format long g

%Given Parameters
Mx = 0
N = 0

%Rectangle - Part 1
a1 = 0;
b1 = 0;
c1 = 0;
A1 = b1*(c1-a1)
Am1 = b1*log(c1/a1)
R1 = (a1+c1)/2

%Triangle - Part 2
a2 = 0;
b2 = 0;
c2 = 0;
A2 = (b2/2)*(c2-a2)
Am2 = (b2*c2*log(c2/a2)/(c2-a2))-b2
R2 = (2*a2+c2)/3

%Trapezium - Part 3
b3_1 = 0;
b3_2 = 0;
a3 = 0;
c3 = 0;
A3 = (b3_1+b3_2)*(c3-a3)/2
Am3 = ((b3_1*c3-b3_2*a3)*log(c3/a3)/(c3-a3))-b3_1+b3_2
R3 = (a3*(2*b3_1+b3_2)+c3*(b3_1+2*b3_2))/(3*(b3_1+b3_2))

%Circle - Part 4
b4 = 0;
R4 = 0;
A4 = pi*(b4^2)
Am4 = 2*pi*(R4-((R4^2-b4^2)^0.5))

%Ellipse - Part 5
b5 = 0;
h5 = 0;
R5 = 0;
A5 = pi*b5*h5
Am5 = 2*pi*b5*(R5-((R5^2-h5^2)^0.5))/h5

%Annular Disc - Part 6
b6_1 = 0;
b6_2 = 0;
R6 = 0;
A6 = pi*(b6_1^2-b6_2^2)
Am6 = 2*pi*(((R6^2-b6_2^2)^0.5)-((R6^2-b6_1^2)^0.5))

%Annular Ellipse - Part 7
b7_1 = 0;
b7_2 = 0;
h7_1 = 0;
h7_2 = 0;
R7 = 0;
A7 = pi*(b7_1*h7_1-b7_2*h7_2)
Am7 = 2*pi*((b7_1*R7/h7_1)-(b7_2*R7/h7_2)-(b7_1*((R7^2-h7_1^2)^0.5)/h7_1)+(b7_2*((R7^2-h7_2^2)^0.5)/h7_2))

%Circular arc with center nearer to the center of curvature - Part 8
a8 = 0;
b8 = 0;
theta8 = 0;
A8 = (b8^2)*theta8-((b8^2)*sin(2*theta8)/2)
R8 = a8+(4*b8*(sin(theta8)^3)/(3*(2*theta8-sin(2*theta8))))
if a8>b8
    Am8 = 2*a8*theta8-2*b8*sin(theta8)-pi*((a8^2-b8^2)^0.5)+2*((a8^2-b8^2)^0.5)*asin((b8+a8*cos(theta8))/(a8+b8*cos(theta8)))
else
    Am8 = 2*a8*theta8-2*b8*sin(theta8)+2*((b8^2-a8^2)^0.5)*log((b8+a8*cos(theta8)+sin(theta8)*((b8^2-a8^2)^0.5))/(a8+b8*cos(theta8)))
end

%Circular arc with center farther from the center of curvature - Part 9
a9 = 0;
b9 = 0;
theta9 = 0;
A9 = (b9^2)*theta9-((b9^2)*sin(2*theta9)/2)
R9 = a9-(4*b9*(sin(theta9)^3)/(3*(2*theta9-sin(2*theta9))))
Am9 = 2*a9*theta9+2*b9*sin(theta9)-pi*((a9^2-b9^2)^0.5)-2*((a9^2-b9^2)^0.5)*asin((b9-a9*cos(theta9))/(a9-b9*cos(theta9)))

%Half Ellipse - Part 10
b10 = 0;
h10 = 0;
a10 = 0;
A10 = pi*b10*h10/2
R10 = a10-(4*h10/(3*pi))
Am10 = 2*b10+(pi*b10*(a10-((a10^2-h10^2)^0.5))/h10)-((2*b10*((a10^2-h10^2)^0.5)*asin(h10/a10))/h10)

%Calculations
A = A1+A2+A3+A4+A5+A6+A7+A8+A9+A10
Am = Am1+Am2+Am3+Am4+Am5+Am6+Am7+Am8+Am9+Am10
R = (R1*A1+R2*A2+R3*A3+R4*A4+R5*A5+R6*A6+R7*A7+R8*A8+R9*A9+R10*A10)/A
Rn = A*Mx/(Am*Mx+N*(A-R*Am)) %Distance of Neutral Axis

%Substitute value for "r" for finding
%Circumferential Stress at that point
r = 0
sigma = (N/A)+((Mx*(A-r*Am))/(A*r*(R*Am-A)))
