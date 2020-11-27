clear all; clc
%Stress components along x,y and z axes
sigma_xx = 0;
sigma_yy = 0;
sigma_zz = 0;
sigma_xy = 0;
sigma_yz = 0;
sigma_xz = 0;

%Invariants
I1 = sigma_xx + sigma_yy + sigma_zz
I2 = det([sigma_xx sigma_xy;sigma_xy sigma_yy]) + det([sigma_xx sigma_xz;sigma_xz sigma_zz]) + det([sigma_yy sigma_yz;sigma_yz sigma_zz])
I3 = det([sigma_xx sigma_xy sigma_xz;...
    sigma_xy sigma_yy sigma_yz;...
    sigma_xz sigma_yz sigma_zz])

%Finding the prinicipal stresses
syms sigma
eqn = sigma^3 - I1*(sigma^2) + I2*sigma - I3 == 0
%Below output gives all 3 roots of above equation
Sigma_roots = vpasolve(eqn,sigma)
s = round(double(Sigma_roots'),2)

%Finding respective direction cosines
%First iteration gives l3,m3,n3
%Second iteration gives l2,m2,n2
%Third iteration gives l1,m1,n1
syms l m n
for i=1:3
    disp('Start of iteration')
    eqn1 = l*(sigma_xx - s(i)) + m*sigma_xy + n*sigma_xz == 0
    eqn2 = l*sigma_xy + m*(sigma_yy - s(i)) + n*sigma_yz == 0
    eqn3 = l*sigma_xz + m*sigma_yz + n*(sigma_zz - s(i)) == 0
    eqn4 = l^2 + m^2 + n^2 == 1
    [L M N] = solve([eqn1 eqn2 eqn3 eqn4],[l m n])
    Normal_Vector = [double(L) double(M) double(N)]'
    disp('End of iteration')
    disp('----------------')
end

%Finding Octahedral stresses
syms sigma_oct tau_oct
Sigma_oct = sigma_oct == double((1/3)*I1)
Tau_oct = tau_oct == double(sqrt((2/9)*I1^2 - (2/3)*I2))
