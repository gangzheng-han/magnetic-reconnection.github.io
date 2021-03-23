for i = 0:19
    for j = 1:20
        n = i*20 + j;
        filename = ['xyzs', num2str(n), '.mat'];
        load(filename);
        subplot(20, 20, n)
        plot(uu);
        axis([0,200000,0,20]);
        %xlabel('t'),ylabel('v');
        set(gca,'xtick',-inf:inf:inf);
        set(gca, 'ytick', -inf:inf:inf);
    end
end
