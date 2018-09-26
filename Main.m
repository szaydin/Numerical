clc
clear all
close all
 
m = [0.5,1,2,3]; %number of points used in interpolation 

for i = 1:length(m)
    
	x = 0:0.5:m(i)*pi; %generate points used for interpolation
    y = sin(x)'; %calculate the function [points corresponding to the indep variable]  
    n = length(x)-1     
	X_new = (0:0.1:2^(1/n)*m(i)*pi)'; %The variables which we will calculate the value of the function against them
    Y_new=polynomial_interp(x,y,X_new,n) ; %Invoking Our Implemented function polynomial_interp
    
    figure(i); %for each value of m generate a new figure
    str='';
    str = sprintf('Interpolated sine vs true sine for %d',m(i)); %Put a proper title for each figure
	plot(x,y,'r');  %Original function is plot in red and solid line
    hold on
    plot(X_new,Y_new,'b--'); %Interpolated function is plot in blue and dashed line
    title(str);
    hold off
    
    %Computing the Error 
    fprintf('for m =%d\n',m(i));
    
    fprintf('Error between interpolated Y and truth ground on X = '); 
    %Between Y and Truth Ground on X
    y1=polynomial_interp(x,y,x,n) ;
    disp(max(y-y1));
    
    fprintf('Error between interpolated Y and truth ground on X_new = '); 
    %Between Y and Truth Ground on X_new
    y2=sin(X_new);
    disp(max(Y_new-y2));
end




