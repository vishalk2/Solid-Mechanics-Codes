%Orthotropic Elasticity Relations
clear all; clc
format long g

%Strains
e_xx = 0;
e_yy = 0;
e_zz = 0;
e_xy = 0;
e_yz = 0;
e_xz = 0;

%Material Properties
Ex = 0;
Ey = 0;
Ez = 0;
Vxy = 0;
Vyz = 0;
Vxz = 0;
Gxy = 0;
Gyz = 0;
Gxz = 0;
delta = (1-Vxy*Vyx-Vyz*Vzy-Vxz*Vzx-2*Vxy*Vyz*Vzx)/(Ex*Ey*Ez)

%Stiffness Matrix Terms
C11 = (1-Vyz*Vzy)/(Ey*Ez*delta)
C12 = (Vyx+Vzx*Vyz)/(Ey*Ez*delta)
C13 = (Vzx+Vyx*Vzy)/(Ey*Ez*delta)
C21 = (Vxy+Vxz*Vzy)/(Ez*Ex*delta)
C22 = (1-Vzx*Vxz)/(Ez*Ex*delta)
C23 = (Vzy+Vzx*Vxy)/(Ez*Ex*delta)
C31 = (Vxz+Vxy*Vyz)/(Ex*Ey*delta)
C32 = (Vyz+Vxz*Vyx)/(Ex*Ey*delta)
C33 = (1-Vxy*Vyx)/(Ex*Ey*delta)
C44 = 2*Gyz
C55 = 2*Gxz
C66 = 2*Gxy

%Stresses
sigma_xx = C11*e_xx + C12*e_yy + C13*e_zz
sigma_yy = C21*e_xx + C22*e_yy + C23*e_zz
sigma_zz = C31*e_xx + C32*e_yy + C33*e_zz
sigma_yz = C44*e_yz
sigma_xz = C55*e_xz
sigma_xy = C66*e_xy
