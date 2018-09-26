
%% jump1
clear all
addpath /cshome/vis/data
load ('human_data.mat')
robot3D('new');
load ('jump1.mat')
Lp =[0;0;0;0];
Rp =[0;0;0;0];
for i= 1:size(L,2)
    Lp = invKin3D(M,Lp,L(:,i));
    angles = Lp;
    Rp = invKin3D(M,Rp,L(:,i));
    angles(5:8,:) = Rp;
robot3D(humanInterp(drad,angles))
end
%% walk1
clear all
addpath /cshome/vis/data
load ('human_data.mat')
robot3D('new');
load ('walk1.mat')
Lp =[0;0;0;0];
Rp =[0;0;0;0];
for i= 1:size(L,2)
    Lp = invKin3D(M,Lp,L(:,i));
    angles = Lp;
    Rp = invKin3D(M,Rp,L(:,i));
    angles(5:8,:) = Rp;
robot3D(humanInterp(drad,angles))
end
%% walk2
clear all
addpath /cshome/vis/data
load ('human_data.mat')
robot3D('new');
load ('walk2.mat')
Lp =[0;0;0;0];
Rp =[0;0;0;0];
for i= 1:size(L,2)
    Lp = invKin3D(M,Lp,L(:,i));
    angles = Lp;
    Rp = invKin3D(M,Rp,L(:,i));
    angles(5:8,:) = Rp;
robot3D(humanInterp(drad,angles))
end
%% walk3
clear all
addpath /cshome/vis/data
load ('human_data.mat')
robot3D('new');
load ('walk3.mat')
Lp =[0;0;0;0];
Rp =[0;0;0;0];
for i= 1:size(L,2)
    Lp = invKin3D(M,Lp,L(:,i));
    angles = Lp;
    Rp = invKin3D(M,Rp,L(:,i));
    angles(5:8,:) = Rp;
robot3D(humanInterp(drad,angles))
end
%% walk4
clear all
addpath /cshome/vis/data
load ('human_data.mat')
robot3D('new');
load ('walk4.mat')
Lp =[0;0;0;0];
Rp =[0;0;0;0];
for i= 1:size(L,2)
    Lp = invKin3D(M,Lp,L(:,i));
    angles = Lp;
    Rp = invKin3D(M,Rp,L(:,i));
    angles(5:8,:) = Rp;
robot3D(humanInterp(drad,angles))
end
%% walk5
clear all
addpath /cshome/vis/data
load ('human_data.mat')
robot3D('new');
load ('walk5.mat')
Lp =[0;0;0;0];
Rp =[0;0;0;0];
for i= 1:size(L,2)
    Lp = invKin3D(M,Lp,L(:,i));
    angles = Lp;
    Rp = invKin3D(M,Rp,L(:,i));
    angles(5:8,:) = Rp;
robot3D(humanInterp(drad,angles))
end
%% walk6
clear all
addpath /cshome/vis/data
load ('human_data.mat')
robot3D('new');
load ('walk6.mat')
Lp =[0;0;0;0];
Rp =[0;0;0;0];
for i= 1:size(L,2)
    Lp = invKin3D(M,Lp,L(:,i));
    angles = Lp;
    Rp = invKin3D(M,Rp,L(:,i));
    angles(5:8,:) = Rp;
robot3D(humanInterp(drad,angles))
end
