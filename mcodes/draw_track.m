function[] = draw_track(n1, n2)
%function[] = draw_track(n1, n2)
close;

load init.mat drange_x drange_z m n
load Bt3.8B1.5R1V8di1.mat Bx By Bz Ex Ey Ez PSI
    for j = 1:m
        for i =1:n
             Ep(i,j) = (Ex(i,j)*Bx(i,j)+Ey(i,j)*By(i,j)+Ez(i,j)*Bz(i,j))/...
                 sqrt(Bx(i,j)*Bx(i,j)+By(i,j)*By(i,j)+Bz(i,j)*Bz(i,j));
        e = Ex(i,j)*Ex(i,j)+Ey(i,j)*Ey(i,j)+Ez(i,j)*Ez(i,j);
        Ev(i,j) = sqrt(e - Ep(i, j)*Ep(i, j));
        end
    end
    fig = figure;
    set(gcf,'unit','normalized','position',[0.05,0.1,0.4,0.8]);
    left_color = [0 0 1];
    right_color = [0 0 0];
    set(fig,'defaultAxesColorOrder',[left_color; right_color]);
    set(gca,'FontSize',25);
    colormap jet
    max_feild = max(max(Ev));
    min_feild = min(min(Ev));
    mid_feild = (max_feild + min_feild) * 0.5;
    max_contour_field = max(max(PSI));
    min_contour_field = min(min(PSI));
    mid_contour_field = (max_contour_field + min_contour_field) * 0.5;


n = n2-n1+1;
for i = n1:1:n2
    filename = ['xyzs', num2str(i), '.mat'];
    load(filename);
    
    subplot(n/2, 4, 2*(i-n1)+1);
    plot(uu);
    axis([0,200000,0,20]);
    [titlex, titlev] = getxv(i);
    title({['x=',num2str(titlex)]; ['v=',num2str(titlev)]});
    
    subplot(n/2, 4, 2*(i-n1)+2);
    hold on
    imagesc(drange_x,drange_z,Ev);
    contour(drange_x,drange_z,(PSI-mid_contour_field) * (max_feild - min_feild)/(max_contour_field - min_contour_field) + mid_feild,50,'black');
    colorbar;
    plot(x1, x3, 'r-');
    %axis([0.9,1.5,-0.65,-0.4]);
    hold off
end
clear;
end