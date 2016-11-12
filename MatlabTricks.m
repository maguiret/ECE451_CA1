clc
clear

% num = 128;                                      % creating the polynomials 
% den = conv([1 0], [1 3 10 24 48 96 128 192]);   % s(s^7 + 3s^6 + 10s^5 ...+192)
% 
% a = tf(num, den);                               % creating transfer function
% 
% b = feedback(a,1);                              % adding a feedback of -1


syms k
s = tf('s');
num = k;
den = conv([1 7 0],[1 11]);
thing = tf([k],den);



% hw3_lastProblem
% mine
thing3 = (2+1/s)*((2*s)/(1+2*s))
thing4 = (5/2*s)+1

% his
thing = 1+(s/(2*s+1))+(5/(2*s))
thing1 = (2*(2*s+1))/(1+2*(2*s+1)*thing)


% hw2_lastProblem 
% HOLY CRAP THIS IS USEFUL
A = [(s^2+6*s+9)    -(3*s+5);
     -(3*s+5)       (2*s^2+5*s+5)];
C = [0;f];
answer = C\A;