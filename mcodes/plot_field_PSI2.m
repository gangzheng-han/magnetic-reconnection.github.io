load field1.mat
load rotEcB.mat
load init.mat

fig = figure;
set(gcf,'unit','normalized','position',[0.05,0.0,0.8,0.7]); %��������Ϊ�����Ļ��ʾ��С
left_color = [0 0 1];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gca,'FontSize',15);
%��ʾ��Χ[��,��,��,��]
%    axis([xl,1.995,-2,2]);
  axis([-2,1.990,-0.75,0.75]);
plot_field_PSI(rotEcB2(:,:),PSI(:,:),200);