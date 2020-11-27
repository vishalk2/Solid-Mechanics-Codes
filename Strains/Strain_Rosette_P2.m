%Strain Rosettes
clear all; clc
format short

%Finding e_xx, e_yy and e_xy
%having known e_a, e_b, and e_c

theta = pi/4; %Using Delta Rosette
%Use pi/4 for Rectangular Rosette
%Direction cosines
%Input given based on the orientation
la = cos(pi/3);
ma = sin(pi/3);
na = 0;

lb = 0;
mb = 1;
nb = 0;

lc = -cos(pi/3);
mc = sin(pi/3);
nc = 0;

%Extensional Strains along a,b, and c directions
e_a = 272;
e_b = 445;
e_c = 150;

%Strains
A = [la^2 ma^2 2*la*ma;lb^2 mb^2 2*lb*mb;lc^2 mc^2 2*lc*mc];
b = [e_a e_b e_c]';
X = A\b
e_xx = X(1)
e_yy = X(2)
e_xy = X(3)
