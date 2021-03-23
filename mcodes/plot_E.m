function E = plot_E(field)
load init.mat
    hold on;
 imagesc(drange_x,drange_z,field);
   colorbar;
    E = 0;
end