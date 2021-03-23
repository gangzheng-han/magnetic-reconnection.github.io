clear;
close;
disp('loading data...')
load intped.mat
load V_nran

num = 400;
data = zeros(200001, 13*num);
x = [-0.35;0;0.03];
x = zeros(3, 100);
ii = linspace(-0.85, 0.15, 20);
jj = linspace(-0.5, 0.5, 20);
k = 1;
for i = ii
    for j = jj
        x(:, k) = [i; 0; j];
        k = k + 1;
    end
end
v = vvv';
v = [0.1, 0, 0.5];
tic;
for i = 1:num
    disp(['Tracking the ',num2str(i),' electron']);
    %data(:, 13*i - 12 : 13*i) = tracking2(x, v(:,i),BX,BY,BZ,EX,EY,EZ);
    data(:, 13*i - 12 : 13*i) = tracking2(x(:,i), v,BX,BY,BZ,EX,EY,EZ);

end
time = toc;
disp(['tracking electron takes ', num2str(time), ' s']);

disp('saving data ...');
t=0:0.0001:20;
t=t';
for i = 1:num
        
        x1=data(:,13*i - 12);
        x2=data(:,13*i - 11);
        x3=data(:,13*i - 10);
        vx=data(:,13*i - 9);
        vy=data(:,13*i - 8);
        vz=data(:,13*i - 7);
        uu=data(:,13*i - 6);
        Bx=data(:,13*i - 5);
        By=data(:,13*i - 4);
        Bz=data(:,13*i - 3);
        Ex=data(:,13*i - 2);
        Ey=data(:,13*i - 1);
        Ez=data(:,13*i);
        
        filename1 = ['xyzs', num2str(i), '.mat'];
        filename2 = ['xyzBs', num2str(i), '.mat'];
        save(filename1, 'x1', 'x2', 'x3', 'vx', 'vy', 'vz', 'uu', 't');
        save(filename2, 'Bx', 'By', 'Bz', 'Ex', 'Ey', 'Ez');
end
toc;
