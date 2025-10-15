clc;
load data_dist.mat
plot(data_distde,data_distdv);

%{
marx = arx(data_distde,[5 7 1]);
mss = n4sid(ze,3,’N4W’,’CVA’,’N4H’,[15 39 39]);
moe = oe(ze,[5 5 1]);
figure; compare(data_distdv,marx,mss,moe);
%}

%advice(data_distdv, 'nonlinear');


ny = 2;       
nu = 1;       
nx = 4;       

x0 = [2.5; 7.5; 0; 0];
theta0 = [0.025  0.045  65  75  55  4.5  4.5  2.5  2.5  2.5  10];

clear m0
m0 = idnlgrey('two_cart_model', [ny nu nx], theta0, x0);

disp(m0)
validate_model(m0)

