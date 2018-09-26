clc
clear all
close all

I = (imread('tumorContour.jpg')); 
[x,y] = find(I(:,:,1) > 200); %image is 2D matrix of type uint8
imshow('tumorContour.jpg');

X_new = x; %(min(x):2:max(x))';

%Counter for interpolation points
for i=1:length(X_new) % iterating over the length of the points to be interpolated 

	%In each iteration 6 points are interpolating into polynomial 
	%Piecewise polynomial fitting is used 
    if(6*i>length(x))
        break;
    end
    
	%Invoke our function with six points for indep,dep variables and 6 points to be interpolated
    Y_new(6*i-5:6*i,1)=polynomial_interp(x(6*i-5:6*i),y(6*i-5:6*i),X_new(6*i-5:6*i),2);

	% avoid zero or nan values appears if singular matrix caculations happens
    for j=5:-1:0
        if(isnan(Y_new(6*i-j)) || Y_new(6*i-j)<1  )
            Y_new(6*i-j)=Y_new(6*i-j-1);
        end
    end
    
end

%Plotting original points versus 
figure(1)
plot(x,y,'b');
hold on
plot(X_new(1:length(Y_new)),Y_new,'r-');
% Computing the max deviation as error 
fprintf('Error between interpolated points and actual truth data in terms of pixels = %f\n',max((Y_new-y)));
