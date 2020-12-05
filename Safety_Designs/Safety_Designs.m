%Safety designs
clear all; clc
%Enter units in SI

%Loads
D = 27.2*(10^3); %Dead Load in N
L = 60.1*(10^3); %Live Load in N
W = 30.1*(10^3); %Wind Load in N

%Other parameters
Y = 241.5*(10^6); %Yield Strength in Pa
SF = 1; %Factor of Safety
phi = 1; %Resistance factor

%Factor of Safety Design
Q1 = D+L+W %Total Service-level Load in N
Ag1 = (10^6)*Q1*SF/Y %Required Area in mm^2
d1 = (4*Ag1/pi)^0.5 %Required Diameter in mm

%Weights
d = 4.2;
l = 4.8;
w = 4.2;

%Limit States Design
LC = [d*D;d*D+l*L;d*D+l*L+w*W] %Load combinations
Q2 = max(LC) %Total Load effect in N
Ag2 = (10^6)*Q2/(phi*Y) %Required Area in mm^2
d2 = (4*Ag2/pi)^0.5 %Required Diamter in mm
