function xdot = SS_Linear(t,x)
global A B K 
u = K*x
xdot = A*x - B*u;
end