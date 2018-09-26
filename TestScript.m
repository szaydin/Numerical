clc
clear all
close all

% =========================================================================
%                               Test Script
% =========================================================================

% -------------------------------------------------------------------------
% Example 2.13
% -------------------------------------------------------------------------

fprintf('=============================================================\n')
fprintf('Test case : 1\n')
fprintf('=============================================================\n')

% Define input Parameters

A = [1 2 2;4 4 2;4 6 4]
b = [3;6;10]

% Perform LU factorization.

fprintf('Performing LU factorization')
[L, U] = myLU(A)

% Solve Ly = b using forward substitution

fprintf('Solving Ly = b using forward substitution')
y = fwdSubst(L, b) 

% Solve Ux = y using backward substitution

fprintf('Solving Ux = b using backward substitution')
x = backSubst(U, y)

% -------------------------------------------------------------------------
% Own test
% -------------------------------------------------------------------------

fprintf('\n\n=============================================================\n')
fprintf('Test case : 2\n')
fprintf('=============================================================\n')

A = [2 -1 5 1;3 2 2 -6;1 3 3 -1;5 -2 -3 3];
b = [-3;-32;-47;49];

% Perform LU factorization.

fprintf('Performing LU factorization')
[L, U] = myLU(A)

% Solve Ly = b using forward substitution

fprintf('Solving Ly = b using forward substitution')
y = fwdSubst(L, b) 

% Solve Ux = y using backward substitution

fprintf('Solving Ux = b using backward substitution')
x = backSubst(U, y)


% =========================================================================
