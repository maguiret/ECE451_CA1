clc
clear

% systems being observed
s = tf('s');
%one = 16/(s^2+3*s+16);
%two = 0.04/(s^2+.02*s+.04);
%three = (s+2.1)/((s+2)*(s^2+s+5));
for i = 1:3
    if      i == 1
        system =16/(s^2+3*s+16);
    elseif  i == 2
        system = 0.04/(s^2+.02*s+.04);
    elseif  i == 3
        system = (s+2.1)/((s+2)*(s^2+s+5));
    end
    
    % Determining the step response of the system in question
    [y,t] = step(system);
    info = stepinfo(system);

    % Extracting info of step response
    settleTime = info.SettlingTime;
    riseTime = info.RiseTime;
    peakTime = info.PeakTime;
    overshoot = info.Overshoot;

    % Finding maximum t and y values for line lengths
    tMax = find(t>=peakTime);
    overShoot = y(tMax(1));             % y-value that coresponds to overShoot

    % Plotting step response with stepinfo points
    figure(i)
    plot(t,y); 
    hold on;
    plot([settleTime settleTime], [0,overShoot]);         % settle
    plot([riseTime riseTime], [0,overShoot]);             % rise
    plot([peakTime peakTime], [0,overShoot]);             % peak
    plot([0 settleTime], [overShoot overShoot]);          % overshoot settleTime proved to be
                                                          % a convenient length for viewing purposes
    
    % varying the title based on the system being analyzed                                                      
    if      i == 1
        title('Problem 1.1')
    elseif  i == 2
        title('Problem 1.2')
    elseif  i == 3
        title('Problem 1.3')
    end
    legend('System', 'Settle', 'Rise', 'Peak', 'Overshoot');

   
    
end


% used for "hand" calculations
%conv for syms
%expand((A*x + 2*A)*(x^2 + x + 5))


%solving system of equations
%[sola, solb, solc, sold]=solve(a + c + b==0,3*a + 
%                               b + 2*c + d==0,7*a + 5*b + 2*d==1,10*a==2.1)

%solving for system output properties
%w*Tr = 1.76*(e^3)-.417*(e^2)+1.03*e+1
%Tp = pi()/((w*sqrt(1-(e)^2)))
%%OS = 100*exp((-(pi()*e))/(sqrt(1-e^2)))

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


% hw2_lastProblem using matrix algebra to solve system equations
% HOLY CRAP THIS IS USEFUL
A = [(s^2+6*s+9)    -(3*s+5);
     -(3*s+5)       (2*s^2+5*s+5)];
C = [0;f];
answer = C\A;
