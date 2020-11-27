%Strain Rosettes
clear all; clc
format long g
%Finding Extensional strains in the directions of a,b and c
%having known e_xx, e_yy and e_xy

theta = pi/3; %Using Delta Rosette
%Use pi/4 for Rectangular Rosette
%Direction cosines
%Input given based on the orientation
la = 1;
ma = 0;
na = 0;

lb = cos(theta);
mb = sin(theta);
nb = 0;

lc = cos(2*theta);
mc = sin(2*theta);
nc = 0;

%Strains
e_xx = 0;
e_yy = 0;
e_xy = 0; %e_yx
%e_xz = e_yz = e_zz = 0;

%Extensional Strains
e_a = (la^2)*e_xx + (ma^2)*e_yy + 2*la*ma*e_xy
e_b = (lb^2)*e_xx + (mb^2)*e_yy + 2*lb*mb*e_xy
e_c = (lc^2)*e_xx + (mc^2)*e_yy + 2*lc*mc*e_xy
