                                                                                                                                                                                                                               %**************************************************%
%�ó������ڻ������ӹ켣ͼ
%���иó���ǰ��������'electron_tracking_with_t.m'���ѵõ�'init.mat'��'field.mat'��'trajectory.mat'.

%clear;
load init.mat
load field111.mat
load xyz1.mat
load rotEcB.mat

%**************************************************%
    %������ʼʱ��ͽ���ʱ�䣬Ĭ�����Ӵ��ڵ�ȫʱ����Ϊ[0,dt_field*(length_frame-1)]
%     t_0 = 28800;
%     t_1 = 28804;
%     
%     start_t = 1;%(t_0-t0)/dt+1;
%     end_t = tp;%(t_1-t0)/dt+1;
    
    %�ó��������֡ͼ���������������֡��[1,length_frame]
%     frame_number = 8;
%**************************************************%
fig = figure;
set(gcf,'unit','normalized','position',[0.05,0.0,0.8,1.2]); %��������Ϊ�����Ļ��ʾ��С

left_color = [0 0 1];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);

% subplot(211);
hold on;
set(gca,'FontSize',25);

%��ʾ��Χ[��,��,��,��]
axis([-2.0,2.0,-2,2]);

plot_field_PSI(rotEcB2(:,:),PSI(:,:),50);
%contour(drange_x(:,:),drange_z(:,:),PSI(:,:,frame_number),50,'k');
%caxis([0.9,1.03]);
%colorbar;
box on;
l1 = plot(x1(:),x3(:),'r','LineWidth',1);
legend(l1,'���ӹ켣','Location','northwest')
xlabel('X'),ylabel('Z');

% subplot(212);
%  hold on;
% 
% yyaxis right
% axis([0,35,0,200]);
% l1 = plot(ts(start_t:end_t)-t_0,us(start_t:end_t),'r','LineWidth',1);
% 
% ylabel('��������')
% set(gca,'FontSize',15);
% legend([l1,l2],'��������','\Omega_{E}','Location','northwest')
%clear;