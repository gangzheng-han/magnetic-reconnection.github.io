function val = plot_field_PSI(field,contour_field,quantity_contour)
load init.mat
    hold on;
    max_feild = max(max(field));
    min_feild = min(min(field));
    mid_feild = (max_feild + min_feild) * 0.5;
    max_contour_field = max(max(contour_field));
    min_contour_field = min(min(contour_field));
    mid_contour_field = (max_contour_field + min_contour_field) * 0.5;
    imagesc(drange_x,drange_z,field);
    contour(drange_x,drange_z,(contour_field-mid_contour_field) * (max_feild - min_feild)/(max_contour_field - min_contour_field) + mid_feild,quantity_contour,'black');
    colorbar;
    val = 0;
end