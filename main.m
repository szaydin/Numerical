clc
clear all
close all

%% Exercise 1

load EllipsePoints.mat

% Estimating translation offsets for each cluster
t1 = mean(Y1,2);
t2 = mean(Y2,2);
t3 = mean(Y3,2);

% Removing average translation offset from data points of each cluster

mY1 = Y1 - t1*ones(1,size(Y1,2));
mY2 = Y2 - t2*ones(1,size(Y2,2));
mY3 = Y3 - t3*ones(1,size(Y3,2));

% Computing covariances
C1 = mY1 * mY1' / size(Y1,2);
C2 = mY2 * mY2' / size(Y2,2);
C3 = mY3 * mY3' / size(Y3,2);

% Estimating eigenvectors and eigen values
[X1,D1] = eig(C1);
[X2,D2] = eig(C2);
[X3,D3] = eig(C3);

% Plotting data points
figure;
plot([Y1(1,:),Y2(1,:),Y3(1,:)]',[Y1(2,:),Y2(2,:),Y3(2,:)]','b.');
axis equal

hold on

% Plotting eigen vectors with their respective eigenvalues
plot(t1(1)+2*sqrt(D1(1,1))*[0 X1(1,1)],t1(2)+2*sqrt(D1(1,1))*[0 X1(2,1)],'g');
plot(t1(1)+2*sqrt(D1(2,2))*[0 X1(1,2)],t1(2)+2*sqrt(D1(2,2))*[0 X1(2,2)],'r');
plot(t2(1)+2*sqrt(D2(1,1))*[0 X2(1,1)],t2(2)+2*sqrt(D2(1,1))*[0 X2(2,1)],'g');
plot(t2(1)+2*sqrt(D2(2,2))*[0 X2(1,2)],t2(2)+2*sqrt(D2(2,2))*[0 X2(2,2)],'r');
plot(t3(1)+2*sqrt(D3(1,1))*[0 X3(1,1)],t3(2)+2*sqrt(D3(1,1))*[0 X3(2,1)],'g');
plot(t3(1)+2*sqrt(D3(2,2))*[0 X3(1,2)],t3(2)+2*sqrt(D3(2,2))*[0 X3(2,2)],'r');

hold off
title('Three data clusters with eigen vectors');

%% Exercise 2

load sincos_basis.mat

figure;
for i = 1:size(Y,2)
    % Here Y are the coefficients and B is the basis vector which remains
    % same
    Ii = renderim(Y(:,i),B,imsize); 
    imshow(Ii,[]); 
    drawnow; 
    pause(0.1);
end;

% Generating a new basis which has twice the frequency of the previous
% basis
X = 0:63;
B1 = sind(360*X/6); 
B2 = cosd(360*X/6);
B1 = repmat(B1,[imsize(1) 1]);  
B2 = repmat(B2,[imsize(1) 1]);  
nB = [B1(:) B2(:)];

figure;
for i = 1:64
    % Here Y are the coefficients and nB is the new basis vector which
    % remains same
    Ii = renderim(Y(:,i),nB,imsize); 
    imshow(Ii,[]); 
    drawnow; 
    pause(0.1);
end;
%% Exercise 3

load immotion_basis.mat

% Displaying resulting images in sequence
figure;
for i = 1:size(Y,2)
    Ii = renderim(Y(:,i),B,imsize); 
    imshow(Ii,[]); 
    drawnow; 
    pause(0.1);
end;

% Generating new set of coefficient for finer translations
[du, dv] = meshgrid(-3:0.2:3,-3:0.2:3);  
Y = [ones(1,length(du(:)));du(:)';dv(:)']; 

% Displaying resulting images in sequence
figure;
for i = 1:size(Y,2)
    Ii = renderim(Y(:,i),B,imsize); 
    imshow(Ii,[]); 
    drawnow; 
end;

%% Exercise 5
movSelect = input('Type 1 and press enter for moving dataset, enter otherwise for light dataset\n');

if movSelect == 1
    load obj_pca
else
    load light_pca
end;

% Interpolation Factor
intFactor = 8;
% Interpolation Order
interpOrder = 5;

% Displaying resulting images in sequence
figure;
for c = 1:size(Y,2)
  Ic = renderim(Y(:,c),B,imsize(1:2));
  imshow(Ic)
  drawnow
end;

% Generating finer grid for interpolation
rangeX = 0:size(Y,2)-1;
rangeX_new = 0:1/intFactor:size(Y,2)-1; 

% Interpolating coefficients using polynomial interpolation
Y_new = zeros(size(Y,1),length(rangeX_new));
for i = 1:size(Y,1)
    Y_new(i,:) = polynomial_interp(rangeX',Y(i,:)',rangeX_new',interpOrder);
end;

% Generating finer grid for interpolation
rangeX = 0:size(Y,2)-1;
rangeX_new = 0:1/intFactor:size(Y,2)-1;   

% Interpolating coefficients using linear piecewise interpolation
Y_new_pw = zeros(size(Y,1),length(rangeX_new));
for i = 1:size(Y,1)
    Y_new_pw(i,:) = linear_interp(rangeX,Y(i,:),rangeX_new);
end;

%for i=1:size(Y,1)
    %figure(i)
    %plot(rangeX,Y(i,:),'*')
    %hold on
    %plot(rangeX_new,Y_new_pw(i,:))
    %hold off
%end


% Displaying resulting images in sequence
figure;
for c = 1:size(Y_new,2)
  Ic = renderim(Y_new(:,c),B,imsize(1:2));
  imshow(Ic)
  drawnow
end;

% Displaying resulting images in sequence
figure;
for c = 1:size(Y_new_pw,2)
  Ic = renderim(Y_new_pw(:,c),B,imsize(1:2));
  imshow(Ic)
  drawnow
end;