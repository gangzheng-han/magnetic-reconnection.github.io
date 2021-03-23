function [data] = tracking2(x, v, BX, BY, BZ, EX, EY, EZ)
gridx = 0.0002;
xmin = -1.8;
zmin = -0.9;
%限定的加速区域：
% x:(0.8 - 1.8)
% z:(-1 - 0)
c=-1000;
xindex = (x(1)-xmin)/gridx+1;
zindex = (x(3)-zmin)/gridx+1;
xindex = int16(xindex);
zindex = int16(zindex);
B=[BX(zindex, xindex), BY(zindex, xindex), BZ(zindex, xindex)];
E=[EX(zindex, xindex), EY(zindex, xindex), EZ(zindex, xindex)];
h=0.0001;
%t=h:h:20;
t=h:h:20;
data = zeros(length(t)+1, 13);
u=sqrt(v(1)*v(1)+v(2)*v(2)+v(3)*v(3));
data(1,:)=[x(1) x(2) x(3) v(1) v(2) v(3) u B E];


for i=1:length(t)
    dv=[c*(E(1)+v(2)*B(3)-v(3)*B(2));
        c*(E(2)-v(1)*B(3)+v(3)*B(1));
        c*(E(3)+v(1)*B(2)-v(2)*B(1))];
    k11=h*dv;
    k21=h*v;
    v1=v+0.5*k11;
    x1=x+0.5*k21;
    
    xindex = (x1(1)-xmin)/gridx+1;
    zindex = (x1(3)-zmin)/gridx+1;
    xindex = int16(xindex);
    zindex = int16(zindex);

    
    try
        B1=[BX(zindex, xindex), BY(zindex, xindex), BZ(zindex, xindex)];
        E1=[EX(zindex, xindex), EY(zindex, xindex), EZ(zindex, xindex)];
    catch
        disp('electron has ran out');
        break
    end
    
    dv1=[c*(E1(1)+v1(2)*B1(3)-v1(3)*B1(2));
         c*(E1(2)-v1(1)*B1(3)+v1(3)*B1(1));
         c*(E1(3)+v1(1)*B1(2)-v1(2)*B1(1));];
    k12=h*dv1;
    k22=h*v1;
    v2=v+0.5*k12;
    x2=x+0.5*k22;
    
    xindex = (x2(1)-xmin)/gridx+1;
    zindex = (x2(3)-zmin)/gridx+1;
    xindex = int16(xindex);
    zindex = int16(zindex);
    try
        B2=[BX(zindex, xindex), BY(zindex, xindex), BZ(zindex, xindex)];
        E2=[EX(zindex, xindex), EY(zindex, xindex), EZ(zindex, xindex)];
    catch
        disp('electron has ran out');
        break
    end
    dv2=[c*(E2(1)+v2(2)*B2(3)-v2(3)*B2(2));
         c*(E2(2)-v2(1)*B2(3)+v2(3)*B2(1));
         c*(E2(3)+v2(1)*B2(2)-v2(2)*B2(1));];
    k13=h*dv2;
    k23=h*v2;
    v3=v+k13;
    x3=x+k23;
    
    xindex = (x3(1)-xmin)/gridx+1;
    zindex = (x3(3)-zmin)/gridx+1;
    xindex = int16(xindex);
    zindex = int16(zindex);
    try
        B3=[BX(zindex, xindex), BY(zindex, xindex), BZ(zindex, xindex)];
        E3=[EX(zindex, xindex), EY(zindex, xindex), EZ(zindex, xindex)];
    catch
        disp('electron has ran out');
        break
    end

    dv3=[c*(E3(1)+v3(2)*B3(3)-v3(3)*B3(2));
         c*(E3(2)-v3(1)*B3(3)+v3(3)*B3(1));
         c*(E3(3)+v3(1)*B3(2)-v3(2)*B3(1));];
    k14=h*dv3;
    k24=h*v3;
    v=v+(k11+2*k12+2*k13+k14)/6;
    x=x+(k21+2*k22+2*k23+k24)/6;
    u=sqrt(v(1)*v(1)+v(2)*v(2)+v(3)*v(3));
    
    xindex = (x(1)-xmin)/gridx+1;
    zindex = (x(3)-zmin)/gridx+1;
    xindex = int16(xindex);
    zindex = int16(zindex);
    try
        B=[BX(zindex, xindex), BY(zindex, xindex), BZ(zindex, xindex)];
        E=[EX(zindex, xindex), EY(zindex, xindex), EZ(zindex, xindex)];
    catch
        disp('electron has ran out');
        break
    end

    data(i+1,:)=[x(1) x(2) x(3) v(1) v(2) v(3) u B E];
%   data(1,:) = [x(1) x(2) x(3) v(1) v(2) v(3) u B E];
end
