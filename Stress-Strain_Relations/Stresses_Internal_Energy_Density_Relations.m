%Stress Strain Relations - U0 (Internal Energy Density)
clear all; clc
format long g
syms e_xx e_yy e_zz e_xy e_yz e_xz
U0 = 0; %U0 is a function of strain variables
sigma_xx = diff(U0,e_xx)
sigma_yy = diff(U0,e_yy)
sigma_zz = diff(U0,e_zz)
sigma_xy = (0.5)*diff(U0,e_xy)
sigma_yz = (0.5)*diff(U0,e_yz)
sigma_xz = (0.5)*diff(U0,e_xz)
