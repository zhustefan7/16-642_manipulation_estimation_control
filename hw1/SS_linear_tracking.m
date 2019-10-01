function xdot = SS_Linear(t,x)
global A B K 
v = square(1/100*2*pi*t)
u =v-K*x;
xdot = A*x - B*u;
end