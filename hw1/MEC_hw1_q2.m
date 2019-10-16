global a b D miu y K C A B;

A = [0,0,1,0;0,0,0,1;0,1,-3,0;0,2,-3,0]
B = [0;0;1;1]
%original R Q parameters
% R = 10
Q = [1,0,0,0;0,5,0,0;0,0,1,0;0,0,0,5]
R = 10;
% Q = [20,0,0,0;
%      0,5,0,0;
%      0,0,20,0;
%      0,0,0,5];

E = eig(A);
[K,S,P] = lqr(A,B,Q,R);
time = [0:0.01:200];
x0_all=[[0;0.1;0;0],[0;0.5;0;0],[0; 1.0886;0;0],[0;1.1;0;0]];
xt = [];

%Part d
for j = 1:size(x0_all,2)
    x0 = x0_all(:,j)
    for i = 1:size(time,2)
        t = time(i);
        xt(1:4,i)=expm((A-B*K)*t)*x0;
    end
    figure();
    plot(time,xt)
    title('unforced system output')
    xlabel('time[s]'); ylabel('System Response')
    legend('x' , 'phi','xdot','phi dot')
end


% plotting with ode
global A B K
for j = 1:size(x0_all,2)
    [t,xt] = ode45(@SS_Linear,time,x0_all(:,j));
    figure()
    plot(time,xt)
    title('Linear System with LQR feedback control Output')
    xlabel('time[s]'); ylabel('System Response yt') 
    legend('x' , 'phi','xdot','phi dot')
end


% part e
global a b D miu y K;
a = 1; 
b =1 ;
D =1 ;
miu=3;
y =2;
for j = 1:size(x0_all,2)
    [t,xt] = ode45(@SS_nonlinear,time,x0_all(:,j));
    figure()
    plot(time,xt);
    legend('x' , 'phi','xdot','phi dot')
    title('Non-Linear System with LQR feedback control Output yt')
    xlabel('time[s]'); ylabel('System Response')
end


%part g
a = 1; 
b =1 ;
D =1 ;
C = [39.3701 0 0 0];
miu=3;
y =2;

v = 0.508*square(1/100*2*pi*time);
x0 = [0;0;0;0]
[t,xt] = ode45(@SS_Nonlinear_tracking,time,x0);

xt= xt*39.3701

figure()
plot(time,xt)
title('state vs time')
xlabel('time[s]')
ylabel('System Responses')


figure()
plot(time,xt(:,1));hold on;
plot(time,v)
legend('Actual Output','Desired Ouput' )
xlabel('time[s]')
ylabel('System Response[m]')


