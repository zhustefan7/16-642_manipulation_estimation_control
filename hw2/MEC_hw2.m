%% Q1
% sys = tf([200],[1 22 141 202]);
% p = pole(sys)
% figure();
% step(sys);

%% Q2 
kp = 400;
kd = 20;
ki = 1;

sys2 = tf([10*kd+kp 10*kp+ki 10*ki],[1 71 kd+1070 100+10*kd+kp 10*kp+ki 10*ki])
figure();
step(sys2);