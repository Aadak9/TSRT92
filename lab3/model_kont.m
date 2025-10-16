function [dx, y] = model_kont(t, x, u, m1,m2,mu1,mu2,k_spring,lk,kappa1,kappa2,l1,l2,L,aux)
%Error if the function takes in theta as one argument instead of the 11
%parameters seperately, weird but it does not work otherwise

x1 = x(1);
x2 = x(2);
x1_dot = x(3);
x2_dot = x(4);

%{
m1 = theta(1);
m2 = theta(2);
mu1 = theta(3);
mu2 = theta(4);
k_spring = theta(5);
lk = theta(6);
kappa1 = theta(7);
kappa2 = theta(8);
l1 = theta(9);
l2 = theta(10);
L = theta(11);
%}
u = u(1);

% Krafterna från fjädrarna vid ändlägen
if x1 < l1
    Fk1 = kappa1*(l1 - x1);
else
    Fk1 = 0;
end

if x2 > L - l2
    Fk2 = kappa2*(L - l2 - x2);
else
    Fk2 = 0;
end

% Rörelseekvationerna
x1_ddot = (1/m1)*(u - mu1*x1_dot + Fk1 + k_spring*((x2 - x1) - lk));
x2_ddot = (1/m2)*(-mu2*x2_dot + Fk2 - k_spring*((x2 - x1) - lk));

% Tidsderivator av tillstånd
dx = [x1_dot;
      x2_dot;
      x1_ddot;
      x2_ddot];

% Utgångar
y = [x1; x2];
end