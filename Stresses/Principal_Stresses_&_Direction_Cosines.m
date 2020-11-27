clear all; clc
%Stress components along x,y and z axes
sigma_xx = 80;
sigma_yy = -21;
sigma_zz = 99;
sigma_xy = 64;
sigma_yz = 21;
sigma_xz = -4;

%Invariants
I1 = sigma_xx + sigma_yy + sigma_zz
I2 = det([sigma_xx sigma_xy;sigma_xy sigma_yy]) + det([sigma_xx sigma_xz;sigma_xz sigma_zz]) + det([sigma_yy sigma_yz;sigma_yz sigma_zz])
I3 = det([sigma_xx sigma_xy sigma_xz;...
    sigma_xy sigma_yy sigma_yz;...
    sigma_xz sigma_yz sigma_zz])

%Gives Sigma roots
sigma_roots = roots([1 -I1 I2 -I3])
s = roots([1 -I1 I2 -I3]);



%Direction cosines
syms l m n
for i=1:3
    disp('Start of iteration')
    eqn1 = l*(sigma_xx - s(i)) + m*sigma_xy + n*sigma_xz == 0;
    eqn2 = l*sigma_xy + m*(sigma_yy - s(i)) + n*sigma_yz == 0;
    eqn3 = l*sigma_xz + m*sigma_yz + n*(sigma_zz - s(i)) == 0;
    eqn4 = l^2 + m^2 + n^2 == 1
    [L M N] = solve([eqn3 eqn2 eqn4],[l m n]);
    Normal_Vector = [double(L) double(M) double(N)]'
    disp('End of iteration')
    disp('----------------')
end
