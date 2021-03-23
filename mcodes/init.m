%**************************************************%
%该程序用于设置HallMHD输出数据的固有参数.
%**************************************************%
%单帧参数
xl = -2.0;
zl = -4.0;
m = 401;
n = 601;
dx = -2*xl/(m-1);
dz =- 2*zl/(n-1);
drange_x = xl:dx:xl+dx*(m-1);

drange_z = zl:dz:zl+dz*(n-1);

%时域参数
% dt_field = 6;
% length_frame = 29;

save('init.mat','drange_x','drange_z','xl','zl','m','n','dx','dz');
clear;