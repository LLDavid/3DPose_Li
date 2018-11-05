%% Input variables
% Thorax coordinate system-origin:(IJ) Deepest point of Incisura Jugularis
% Clavicle coordinate system-origin: (SC) Most ventral point on the sternoclavicular joint
% Scapula coordinate system—origin: (AA)
skel.head=[0, 10, 1]; %1
skel.thorax=[0, 9, 1]; %2
skel.shoulder_L=[2, 8.5, 1];%3
skel.shoulder_R=[-2, 8.5, 1];%4
skel.elbow_L=[3, 7, 2];%5
skel.elbow_R=[-3, 7, 3];%6
skel.wrist_L=[4, 5, 5];%7
skel.wrist_R=[-4, 5, 4];%8
skel.pelvis=[0, 5, 1];%9
skel.gtrochanter_L=[2, 5, 1];%10
skel.gtrochanter_R=[-2, 5, 1];%11
skel.patellar_L=[2, 3, 1];%12
skel.patellar_R=[-2, 3, 1];%13
skel.ankle_L=[2, 1, 1];%14
skel.ankle_R=[-2, 1, 1];%15

xyz=[skel.head;skel.thorax;skel.shoulder_L;skel.shoulder_R;...
   skel.elbow_L;skel.elbow_R;skel.wrist_L;skel.wrist_R;skel.pelvis;...
   skel.gtrochanter_L;skel.gtrochanter_R;skel.patellar_L;...
   skel.patellar_R;skel.ankle_L;skel.ankle_R];
xyz=xyz+3;

%% Plot skeleton
rgb=sum(abs(xyz),2);
scatter3(xyz(:,1),xyz(:,2),xyz(:,3),10,rgb)
hold on
plot3(xyz(1:2,1),xyz(1:2,2),xyz(1:2,3),'o-')
plot3(xyz([2,3],1),xyz([2,3],2),xyz([2,3],3),'o-')
plot3(xyz([2,4],1),xyz([2,4],2),xyz([2,4],3),'o-')
plot3(xyz([3,5],1),xyz([3,5],2),xyz([3,5],3),'o-')
plot3(xyz([4,6],1),xyz([4,6],2),xyz([4,6],3),'o-')
plot3(xyz([5,7],1),xyz([5,7],2),xyz([5,7],3),'o-')
plot3(xyz([6,8],1),xyz([6,8],2),xyz([6,8],3),'o-')
plot3(xyz([2,9],1),xyz([2,9],2),xyz([2,9],3),'o-')
plot3(xyz([9,10],1),xyz([9,10],2),xyz([9,10],3),'o-')
plot3(xyz([9,11],1),xyz([9,11],2),xyz([9,11],3),'o-')
plot3(xyz([10,12],1),xyz([10,12],2),xyz([10,12],3),'o-')
plot3(xyz([11,13],1),xyz([11,13],2),xyz([11,13],3),'o-')
plot3(xyz([12,14],1),xyz([12,14],2),xyz([12,14],3),'o-')
plot3(xyz([13,15],1),xyz([13,15],2),xyz([13,15],3),'o-')
view(skel.thorax)

%% Angle
% Vector shoulder-elbow-wrist
%u = xyz(7,:)-xyz(5,:);
%v = xyz(3,:)-xyz(5,:);
%ThetaInDegrees = atan2d(norm(cross(u,v)),dot(u,v));
mu=1.2*ones(1,3);
sigma=0.1*eye(3);
angle_elbow=zeros(1,10000);
for i=1:10000
    xyz_3 = mvnrnd(mu,sigma)+ xyz(3,:);
    xyz_5 = mvnrnd(mu,sigma)+ xyz(5,:);
    xyz_7 = mvnrnd(mu,sigma)+ xyz(7,:);
    u = xyz_7-xyz_5;
    v = xyz_3-xyz_5;
    angle_elbow(i)=atan2d(norm(cross(u,v)),dot(u,v));
end