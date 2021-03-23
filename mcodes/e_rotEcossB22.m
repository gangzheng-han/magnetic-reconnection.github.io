load xyz2.mat
load field1.mat
x=[1.08;0;-0.58];
v=[0.0;0.6;0.0];
c=-1000;
E=[0 0 0];
B=[0 0 0];
e_rotEcB2=0;
dx=0.008;
dz=2*dx;
[x0,z0]=meshgrid(-2:0.008:2,-4:0.016:4);
for t=1:500001
    x=[x1(t) x2(t) x3(t)];
    B=[interp2(x0,z0,Bx,x(1),x(3),'cubic') interp2(x0,z0,By,x(1),x(3),'cubic') interp2(x0,z0,Bz,x(1),x(3),'cubic')];
    E=[interp2(x0,z0,Ex,x(1),x(3),'cubic') interp2(x0,z0,Ey,x(1),x(3),'cubic') interp2(x0,z0,Ez,x(1),x(3),'cubic')];
    x11=x(1)+0.008;
 
%     B1=[interp2(x0,z0,Bx,x11,x(3),'cubic') interp2(x0,z0,By,x11,x(3),'cubic') interp2(x0,z0,Bz,x11,x(3),'cubic')];
    E1=[interp2(x0,z0,Ex,x11,x(3),'cubic') interp2(x0,z0,Ey,x11,x(3),'cubic') interp2(x0,z0,Ez,x11,x(3),'cubic')];
    x22=x(1)-0.008;
   
%     B2=[interp2(x0,z0,Bx,x22,x(3),'cubic') interp2(x0,z0,By,x22,x(3),'cubic') interp2(x0,z0,Bz,x22,x(3),'cubic')];
    E2=[interp2(x0,z0,Ex,x22,x(3),'cubic') interp2(x0,z0,Ey,x22,x(3),'cubic') interp2(x0,z0,Ez,x22,x(3),'cubic')];
    
    z11=x(3)+0.016;
%     B3=[interp2(x0,z0,Bx,x(1),z11,'cubic') interp2(x0,z0,By,x(1),z11,'cubic') interp2(x0,z0,Bz,x(1),z11,'cubic')];
    E3=[interp2(x0,z0,Ex,x(1),z11,'cubic') interp2(x0,z0,Ey,x(1),z11,'cubic') interp2(x0,z0,Ez,x(1),z11,'cubic')];
   
    z22=x(3)-0.016;
%     B4=[interp2(x0,z0,Bx,x(1),z22,'cubic') interp2(x0,z0,By,x(1),z22,'cubic') interp2(x0,z0,Bz,x(1),z22,'cubic')];
    E4=[interp2(x0,z0,Ex,x(1),z22,'cubic') interp2(x0,z0,Ey,x(1),z22,'cubic') interp2(x0,z0,Ez,x(1),z22,'cubic')];
   
   e_rotEcB2(t)=-(B(1)*(-(E3(2)-E4(2))/2*dz+B(3)*(E1(2)-E2(2))/2*dx))/sqrt(B(1)*B(1)+B(3)*B(3));
end
plot(e_rotEcB2);
save('e_rotEcB22.mat','e_rotEcB2');
