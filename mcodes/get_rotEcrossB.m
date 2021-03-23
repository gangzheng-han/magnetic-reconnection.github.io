%**************************************************%
%该程序用于求rotEcrossB.
%运行该程序前，须已得到'init.mat'及'field.mat'.

%clear;
load init.mat
load field1.mat

%**************************************************%
rotEcB2 = 0;
rotEcB3 = 0;
% for t = 1:length_frame
%     disp(['开始计算第',num2str(t),'帧...']);
    for j = 2:m-1
        for i =2:n-1
            rotEcB2(i,j) = -(Bx(i,j)*(-(Ey(i+1,j)-Ey(i-1,j))/(2*dz))+Bz(i,j)*((Ey(i,j+1)-Ey(i,j-1))/(2*dx)))/sqrt(Bx(i,j)*Bx(i,j)+Bz(i,j)*Bz(i,j));
        end
     end
%{
    for j = 2:500
        for i =2:500
            rotEcB3(i,j,t) = (Bx(i,j,t)*(-(Ey(i+1,j,t)-Ey(i-1,j,t))/(2*dz))+By(i,j,t)*((Ex(i+1,j,t)-Ex(i-1,j,t))(2*/dz)-(Ez(i,j+1,t)-Ez(i,j-1,t))(2*/dx))+Bz(i,j,t)*((Ey(i,j+1,t)-Ey(i,j-1,t))/(2*dx))/sqrt(Bx(i,j,t)*Bx(i,j,t)+By(i,j,t)*By(i,j,t)+Bz(i,j,t)*Bz(i,j,t)));

        end
    end
%}
% end
disp('正在保存数据.');
save('rotEcB.mat','rotEcB2','rotEcB3');
%clear;