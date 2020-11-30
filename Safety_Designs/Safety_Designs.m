%Safety designs
clear all; clc
%Enter units in SI

%Loads
D = 25000; %Dead Load in N
L = 60000; %Live Load in N
W = 30000; %Wind Load in N

%Other parameters
Y = 250*(10^6); %Yield Strength in Pa
SF = 5/3; %Factor of Safety
phi = 0.9; %Resistance factor

%Factor of Safety Design
Q1 = D+L+W %Total Service-level Load in N
Ag1 = (10^6)*Q1*SF/Y %Required Area in mm^2
d1 = (4*Ag1/pi)^0.5 %Required Diameter in mm

%Limit States Design
LC = [1.4*D;1.2*D+1.6*L;1.2*D+0.5*L+1.6*W] %Load combinations
Q2 = max(LC) %Total Load effect in N
Ag2 = (10^6)*Q2/(phi*Y) %Required Area in mm^2
d2 = (4*Ag2/pi)^0.5 %Required Diamter in mm
