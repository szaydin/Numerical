clc;
close all;
clear;

% =====================================================================
%                  Image Processing Exercise
% =====================================================================

% Read the image

A = imread ('a.jpg');

% =====================================================================

% Display original image

subplot(2,3,1), imshow(A); title('Original Image');
pause();

% =====================================================================

% Display grayscale image

G = rgb2gray(A);
subplot(2,3,2), imshow(G); title('Grayscale Image');
pause();

% =====================================================================

% Display the selected region

figure;
imshow(A);
rect = getrect;
B = imcrop(A,rect);
close(figure(2));
subplot(2,3,3), imshow(B); title('Selected Region');
pause();

% ======================================================================

% Contrast change

fprintf('Would you like to increase or decrease contrast?\n')
key = input('press "+" for increase or press "-" for decrease :', 's');
value = input('Enter a value between as a percentage :');
if key == '+'
    K = luminance_change(A, 'c+' , value);
else
    K = luminance_change(A, 'c-' , value);
end
subplot(2,3,4) , imshow(K); title('Modified Contrast');
pause();

% ======================================================================

% Brightness change

fprintf('Would you like to increase or decrease brightness?\n')
key = input('press "+" for increase or press "-" for decrease :', 's');
value = input('Enter a value as a percentage :');
if key == '+'
    K = luminance_change(A, 'b+' , value);
else
    K = luminance_change(A, 'b-' , value);
end
subplot(2,3,5) , imshow(K); title('Modified Brightness');
pause();

% ======================================================================

% Gaussian filter.

blur = imgaussfilt(A,4);
subplot (2,3,6) , imshow(blur); title('Gaussian filter');
