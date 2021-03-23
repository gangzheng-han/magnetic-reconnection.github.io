%**************************************************%
%该程序用于画出电场和磁场.
%**************************************************%
load init.mat
load field1.mat
fig = figure;
set(gcf,'unit','normalized','position',[0.05,0.1,0.4,1.0]); %方括号内为相对屏幕显示大小
left_color = [0 0 1];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gca,'FontSize',25);
% 显示范围[左,右,下,上]
  axis([xl,-xl,zl,-zl]);
%   axis([-1,1,-2,2]);
  plot_Ey(Ey(:,:),PSI(:,:),25);
            
%            x=linspace(-2,2,m);
%            z=linspace(-4,4,n);
% %             imagesc(z,x,Ey);
%                pcolor(x,z',Ey);
%             grid on
%            colormap(jet); 
%             %set(gca, 'edgecolor','none')
%             shading interp;
%              colorbar;
%             a=max(max(Ey));
%             b=min(min(Ey));
%             caxis([b a]);
%             hold on;
%             contour(x,z',PSI,'color',[0,0,0],'Linestyle',':','LineWidth',0.1);