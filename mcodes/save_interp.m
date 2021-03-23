load Bt3.8B1.5R1V8di1.mat Bx By Bz Ex Ey Ez
load init.mat dx dz xl zl
%限定的加速区域：
% x:(0.8 - 1.8)
% z:(-1 - 0)
xmin = -1.8;
zmin = -0.9;
dgrid = 0.0002;
[x0,z0]=meshgrid(xl:dx:-xl,zl:dz:-zl);
[xx, zz] = meshgrid(xmin:dgrid:-xmin, zmin:dgrid:-zmin);
%[xx, zz] = meshgrid(0.8:0.0001:1.8, -1:0.0001:0);
BX = interp2(x0, z0, Bx, xx, zz, 'cubic');
BY = interp2(x0, z0, By, xx, zz, 'cubic');
BZ = interp2(x0, z0, Bz, xx, zz, 'cubic');
EX = interp2(x0, z0, Ex, xx, zz, 'cubic');
EY = interp2(x0, z0, Ey, xx, zz, 'cubic');
EZ = interp2(x0, z0, Ez, xx, zz, 'cubic');
save('intped.mat', 'BX', 'BY', 'BZ', 'EX', 'EY', 'EZ');
