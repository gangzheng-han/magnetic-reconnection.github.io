 load init.mat
  load Bt3.8B1.5R1V8di1.mat
v = zeros(3, 100);
vv=zeros(100, 3);
vvv=zeros(100, 3);
for i = 1:100
   [v(1,i),v(2,i),v(3,i)] = nran();
   vv(i,:)=[v(1,i),v(2,i),v(3,i)];
 x=[1.2;0;-0.55];
% v=[0.2,0.9,0.0];
%  B=[3 4 0];
[x0,z0]=meshgrid(xl:dx:-xl,zl:dz:-zl);
B=[interp2(x0,z0,Bx,x(1),x(3),'cubic') ...
interp2(x0,z0,By,x(1),x(3),'cubic') interp2(x0,z0,Bz,x(1),x(3),'cubic')];
e= sqrt(B(1)*B(1)+B(2)*B(2)+B(3)*B(3));
vx1=v(1,i)*B(1)/e;
vy1=v(1,i)*B(2)/e;
vz1=v(1,i)*B(3)/e;
vx2=sqrt(v(2,i)*v(2,i)/(1+(B(1)*B(1))/(B(2)*B(2))));
vy2=sqrt(v(2,i)*v(2,i)/(1+(B(2)*B(2))/(B(1)*B(1))));
vx=vx1+vx2;
vy=vy1+vy2;
vz=vz1;
vvv(i,:)=[vx,vy,vz];
end
disp('正在保存数据.');
save('V_nran.mat', 'vv','vvv');
clear;