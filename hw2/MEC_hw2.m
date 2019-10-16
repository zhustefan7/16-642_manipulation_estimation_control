%% Q1
sys = tf([200],[1 22 141 202]);
p = pole(sys)
figure();
step(sys);

%% Q2 
kp = 119;
kd = 700;
ki = 40;


sys2 = tf([10*kd+kp 10*kp+ki 10*ki],[1 71 kd+1070 100+10*kd+kp 10*kp+ki 10*ki])
[y,t]=step(sys2);
stepinfo(sys2)
figure();
plot(t,y);hold on;
xlabel('time[s]')
ylabel('Response[m]')
final_val = y(end)
% plot(t,final_val);





%% Q3

global a b D miu y Kc Ko C A B;

A = [0,0,1,0;0,0,0,1;0,1,-3,0;0,2,-3,0]
B = [0;0;1;1]
a = 1; 
b =1 ;
D =1 ;
C = [39.3701 0 0 0];
miu=3;
y =2;
Q = [100,0,0,0;
     0,5,0,0;
     0,0,100,0;
     0,0,0,5]
R = 15;

[Kc,S,P] = lqr(A,B,Q,R);
time = [0:0.01:10];
% p = [ -20  ,-21, -22,-23];
p = [ -20  ,-21, -10+0.2i,-10-0.2i];

Ko = place(A',C',p)'

v = 20*square(1/100*2*pi*time);
x0 = [0;0;0;0;0;0;0;0];
[t,xt] = ode45(@SS_state_tracking_v2,time,x0);
xt= xt*39.3701;

figure()
plot(time,xt(:,1:4))
title('state vs time')
xlabel('time[s]')
ylabel('System Responses')


figure()
plot(time,xt(:,1));hold on;
plot(time,v)
legend('Actual Output','Desired Ouput' )
xlabel('time[s]')
ylabel('System Response[m]')

