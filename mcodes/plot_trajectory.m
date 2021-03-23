                                                                                                                                                                                                                               %**************************************************%
%该程序用于绘制粒子轨迹图
%运行该程序前，须运行'electron_tracking_with_t.m'或已得到'init.mat'、'field.mat'及'trajectory.mat'.

%clear;
load init.mat
load field111.mat
load xyz1.mat
load rotEcB.mat

%**************************************************%
    %设置起始时间和结束时间，默认粒子存在的全时间域为[0,dt_field*(length_frame-1)]
%     t_0 = 28800;
%     t_1 = 28804;
%     
%     start_t = 1;%(t_0-t0)/dt+1;
%     end_t = tp;%(t_1-t0)/dt+1;
    
    %该程序输出单帧图像，须设置输出场量帧号[1,length_frame]
%     frame_number = 8;
%**************************************************%
fig = figure;
set(gcf,'unit','normalized','position',[0.05,0.0,0.8,1.2]); %方括号内为相对屏幕显示大小

left_color = [0 0 1];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);

% subplot(211);
hold on;
set(gca,'FontSize',25);

%显示范围[左,右,下,上]
axis([-2.0,2.0,-2,2]);

plot_field_PSI(rotEcB2(:,:),PSI(:,:),50);
%contour(drange_x(:,:),drange_z(:,:),PSI(:,:,frame_number),50,'k');
%caxis([0.9,1.03]);
%colorbar;
box on;
l1 = plot(x1(:),x3(:),'r','LineWidth',1);
legend(l1,'电子轨迹','Location','northwest')
xlabel('X'),ylabel('Z');

% subplot(212);
%  hold on;
% 
% yyaxis right
% axis([0,35,0,200]);
% l1 = plot(ts(start_t:end_t)-t_0,us(start_t:end_t),'r','LineWidth',1);
% 
% ylabel('电子速率')
% set(gca,'FontSize',15);
% legend([l1,l2],'电子速率','\Omega_{E}','Location','northwest')
%clear;