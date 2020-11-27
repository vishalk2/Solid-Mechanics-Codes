clear all; clc
%Entering Plane stresses
sigma_xx = 272;
sigma_xy = 445;
sigma_yy = 150;
T = [sigma_xx sigma_xy;sigma_xy sigma_yy]

%Center & Radius of Mohr's circle
C = [(1/2)*(sigma_xx+sigma_yy),0]
R = sqrt((1/4)*(sigma_xx-sigma_yy)^2 + (sigma_xy^2))

%Angle to be rotated = theta
theta = 80

%Stresses after rotating through an angle theta
syms sigma_XX sigma_YY sigma_XY
eqn1 = sigma_XX == (1/2)*(sigma_xx+sigma_yy) + (1/2)*(sigma_xx-sigma_yy)*cosd(2*theta) + sigma_xy*sind(2*theta)
eqn2 = sigma_YY == (1/2)*(sigma_xx+sigma_yy) - (1/2)*(sigma_xx-sigma_yy)*cosd(2*theta) - sigma_xy*sind(2*theta)
eqn3 = sigma_XY == (1/2)*(sigma_yy-sigma_xx)*sind(2*theta) + sigma_xy*cosd(2*theta)

%If required to find principal stresses
sigma_1 = C(1,1) + R
sigma_2 = C(1,2) - R
sigma_XY_Max = R
%Angle required to find these Principal vectors
theta_1 = atand(2*sigma_xy/(sigma_xx-sigma_yy))/2
theta_1_radians = atan(2*sigma_xy/(sigma_xx-sigma_yy))/2
theta_2 = theta_1+90
theta_2_radians = theta_1_radians + (pi/2)

%Angle to be rotated for max Shear stress
theta_s = atand((sigma_yy-sigma_xx)/(2*sigma_xy))/2
theta_s_radians = atan((sigma_yy-sigma_xx)/(2*sigma_xy))/2
