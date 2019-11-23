syms c1 s1 d2 c3 s3 c2 s2;
syms t1 t2 t3
% format short
%% Question 3
% method 1
H0_1 = [c1,-s1,0,0;s1,c1,0,0;0,0,1,0;0,0,0,1]* [1,0,0,0;0,1,0,0;0,0,1,10+d2;0,0,0,1];
H1_2 = [1,0,0,9;0,1,0,0;0,0,1,0;0,0,0,1]*[1,0,0,0;0,0,-1,0;0,1,0,0;0,0,0,1];
H0_2 = H0_1*H1_2;
H2_3 = [c3,-s3,0,0;s3,c3,0,0;0,0,1,0;0,0,0,1]*[1,0,0,5;0,1,0,0;0,0,1,0;0,0,0,1];


H0_3 = H0_2*H2_3;

H0_0 = eye(4);


Jv1 = cross(H0_0(1:3,1:3)*[0;0;1],(H0_3(1:3,4)-H0_0(1:3,4)))
Jv2 = H0_1(1:3,1:3)*[0;0;1]
Jv3 = cross(H0_2(1:3,1:3)*[0;0;1],(H0_3(1:3,4)-H0_2(1:3,4)))


%method 2 
% H0_1 = rot_z(t1)*tranz(10+d2)
% H1_2 = tranx(9)*rot_x(pi/2);
% H0_2 = H0_1 * H1_2;
% H2_3 = rot_z(t3)*tranx(5);
% H0_3 = H0_2 * rot_z(t3)*tranx(5
% 
% J_q3 = jacobian(H0_3(1:3,4),[t1,d2,t3])


%% Question 4
% 
% H0_1 = [c1,-s1,0,0;s1,c1,0,0;0,0,1,0;0,0,0,1] * [1,0,0,1;0,1,0,0;0,0,1,0;0,0,0,1];
% H0_2 = H0_1 * [c2,-s2,0,0;s2,c2,0,0;0,0,1,0;0,0,0,1] * [1,0,0,1;0,1,0,0;0,0,1,0;0,0,0,1];
% H0_3 = H0_2 * [c3,-s3,0,0;s3,c3,0,0;0,0,1,0;0,0,0,1] * [1,0,0,1;0,1,0,0;0,0,1,0;0,0,0,1];
% Jv1 = cross(H0_0(1:3,1:3)*[0;0;1],(H0_3(1:3,4)-H0_0(1:3,4)));
% Jv2 = cross(H0_1(1:3,1:3)*[0;0;1],(H0_3(1:3,4)-H0_1(1:3,4)));
% Jv3 = cross(H0_2(1:3,1:3)*[0;0;1],(H0_3(1:3,4)-H0_2(1:3,4)));


% syms t1 t2 t3
t1 = -41.2;
t2 = 82.8;
t3 = -41.4;
H0_0 = eye(4);
H0_1 = rot_z(t1) * tranx(1);
H0_2 = H0_1 * rot_z(t2) * tranx(1);
H0_3 = H0_2 * rot_z(t3) * tranx(0.5);
% H0_3 = rot_z(t1) * tranx(1)*rot_z(t2) * tranx(1)*rot_z(t3) * tranx(0.5);

Jv1 = cross(H0_0(1:3,1:3)*[0;0;1],(H0_3(1:3,4)-H0_0(1:3,4)))
Jv2 = cross(H0_1(1:3,1:3)*[0;0;1],(H0_3(1:3,4)-H0_1(1:3,4)))
Jv3 = cross(H0_2(1:3,1:3)*[0;0;1],(H0_3(1:3,4)-H0_2(1:3,4)))

j = [Jv1(1:2), Jv2(1:2), Jv3(1:2)]
peuso_inv_j = j'*inv(j*j');
x_dot = [0;10;];
theta_dot = subs(peuso_inv_j) * x_dot





% 
% j = jacobian(H0_3(1:3,4),[t1,t2,t3]);
% j = j(1:2,:);
% peuso_inv_j = j'*inv(j*j');
% t1 = -41.2;
% t2 = -82.8;
% t3 = -41.4;
% j = subs(j)
% 
% x_dot = [0;10;];
% theta_dot = subs(peuso_inv_j) * x_dot
% theta_dot(1)
%% function definitions

function matrix = rot_z(theta)
matrix = [cosd(theta),-sind(theta),0,0;
          sind(theta),cosd(theta),0,0;
          0,0,1,0;
          0,0,0,1];
end


function matrix = rot_x(theta)
matrix = [1,0,0,0;
          0,cosd(theta),-sind(theta),0;
          0,sind(theta),cosd(theta),0;
          0,0,0,1;];
end

function matrix = tranx(d)
matrix = [1,0,0,d;0,1,0,0;0,0,1,0;0,0,0,1];
end


function matrix = tranz(d)
matrix = [1,0,0,0;0,1,0,0;0,0,1,d;0,0,0,1];
end


