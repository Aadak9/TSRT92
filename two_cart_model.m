function [dx, y] = two_cart_model(t, x, u, theta, aux)

m1     = theta(1);
m2     = theta(2);
kappa1 = theta(3);
kappa2 = theta(4);
k      = theta(5);
mu1    = theta(6);
mu2    = theta(7);
l1     = theta(8);
l2     = theta(9);
lk     = theta(10);
L      = theta(11);


x1 = x(1);   
x2 = x(2);   
v1 = x(3);   
v2 = x(4);   
F  = u(1);   



F1_wall = kappa1*(l1 - x1)*(x1 < l1);
F2_wall = kappa2*((L - l2) - x2)*(x2 > (L - l2));



F_spring = k * ((x2 - x1) - lk);


F_fric1 = mu1 * v1;
F_fric2 = mu2 * v2;


dx1 = v1;
dv1 = ( -F_spring + F1_wall - F_fric1 + 0 ) / m1;    
dx2 = v2;
dv2 = (  F_spring - F2_wall - F_fric2 + F ) / m2;   

dx = [dx1; dx2; dv1; dv2];

y = [x1; x2];  
end