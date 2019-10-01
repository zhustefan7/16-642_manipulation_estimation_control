%part a
A = [0,1,0; 0,0,1; 1,5,7]
B= [1;0;0]
C = [0 1 3]
% C= A*A*B
E = eig(A)

%part b
W_c= [1 ,0,0; 0,0,1;0,1,7]
determinant = det(W_c)


% part c 
time = linspace(0,2,1000);
xt = []
x0  = [0;1;0]
for j = 1: size(time,2)
    xt(:,end+1) = expm(A*time(j))*x0;
end
y = C*xt;
figure(1)
% plot(time, xt(1,:))
plot(time, y)
title('unforced system output')
xlabel('time[s]'); ylabel('System Response')




%part d
p = [ -1+i  -1-i -2];
k = place(A,B,p)


%part e
time = linspace(0,10,1000);
xt = []
for j = 1:size(time,2)
    t= time(j)
    xt(:,j)=expm((A-B*k)*t)*x0;
end
y_forced = C*xt;
figure(2)
plot(time ,y_forced)
title('system output under feedback law')
xlabel('time[s]'); ylabel('System Response')

% ML hw2 plot
train_error = [0.4429530201342282, 0.20134228187919462, 0.1342281879194631, 0.11409395973154363, 0.10738255033557047, 0.087248322147651, 0.0738255033557047,0.06711409395973154]
test_error = [0.5060240963855421, 0.21686746987951808, 0.1566265060240964, 0.1686746987951807, 0.20481927710843373, 0.1686746987951807, 0.1927710843373494, 0.20481927710843373]
max_depth = [0:7]
figure()
plot(max_depth,train_error);hold on;
plot(max_depth,test_error);
legend('training error','testing error')
xlabel('max depth'); ylabel('error')
