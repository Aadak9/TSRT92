%% Task 1

m1 = 0.025;
m2 = 0.045;
mu1 = 4.5;
mu2 = 4.5;
k_spring = 55;
lk = 2.5;
kappa1 = 65;
kappa2 = 75;
l1 = 2.5;
l2 = 2.5;
L = 10;
theta0=[0.025,0.045,4.5,4.5,55,2.5,65,75,2.5,2.5,10]';
x0=[3.5733;6.5379;0;0];
m0 = idnlgrey('model_kont',[2 1 4],theta0,x0);
disp(m0)

validate_model(m0)

%% Task2
clc
m=pem(data_dist,m0);
m = setinit(m, 'Value', {data_undist.y(1,1), data_undist.y(1,2), 0, 0});
compare(data_undist,m)

%% Task3
x0=[5;8;0;0];
m0 = idnlgrey('model_kont',[2 1 4],theta0,x0);
disp(m0)

%% Task4
clc
opt = nlarxOptions('SearchMethod','lm');
na = [2 1; 1 2];
nb = [1 ; 0];
nk = [1 ; 0];
d = 30
m10 = nlarx(data_dist, [na, nb, nk], idSigmoidNetwork(d),opt);

%net_estimator = idFeedforwardNetwork(feedforwardnet(d));
%Mnet = nlarx(data_dist,[na nb nk],net_estimator);
%compare(data_undist,m)
compare(data_undist,m10)

%net_estimator = idFeedforwardNetwork(cascadeforwardnet(d));

%Mnet = nlarx(data,[na nb nk],net_estimator);

%net = feedforwardnet(d);
%net.layers{i}.transferFcn = 'poslin';
%net_estimator = idFeedforwardNetwork(net);

%% Task5
d = 30;
Lambda = 1.2;
opt = nlarxOptions('SearchMethod','lm');
opt.Regularization.Lambda = Lambda;
na = [2 1; 1 2];
nb = [1 ; 0];
nk = [1 ; 0];
orders = [na, nb, nk];
m = nlarx(data_dist, orders, idSigmoidNetwork(d), opt);
compare(data_undist,m)

%% Task6
d=10;
na = [2 1; 1 2];
nb = [1 ; 0];
nk = [1 ; 0];
orders = [na, nb, nk];
opt = nlarxOptions('SearchMethod','lm');
opt.SearchOptions.MaxIterations = 20;
m = nlarx(data_dist, orders, idSigmoidNetwork(d), opt);
compare(data_undist,m)

%% Task7
clc
opt = nlarxOptions('SearchMethod','lm');
na = [2 1; 1 2];
nb = [1 ; 0];
nk = [1 ; 0];
d = 11
net = feedforwardnet(d);
net.layers{1}.transferFcn = 'poslin';
net_estimator = idFeedforwardNetwork(net);
Mnet = nlarx(data_dist,[na nb nk],net_estimator);
compare(data_undist,Mnet)