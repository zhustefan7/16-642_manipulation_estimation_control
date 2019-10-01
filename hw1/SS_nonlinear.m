function dqdt = SS(t,x)
global a b D miu y K;
F = -K*x;
dqdt= [x(3);x(4);a/(y*a-b^2*cos(x(2)^2))*(F+b/a*D*sin(x(2)*cos(x(2)))-b*x(4)^2*sin(x(2))-miu*x(3));
    (b*cos(x(2)))/(y*a-b^2*cos(x(2)^2))*(F+b/a*D*sin(x(2)*cos(x(2)))-b*x(4)^2*sin(x(2))-miu*x(3))+D*sin(x(2))/a];
end 