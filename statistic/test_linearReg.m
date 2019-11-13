%% This script tests the linear regression 
% script against the polyfit function of matlab

clear all;
close all;

% create test signal
N = 20;
xl = [0 5];
x = xl(2)*rand(N,1);
y = x + (rand(N,1)-.5);
N_noise = round(.2*length(y));
%y(1:N_noise) = xl(2)*rand(N_noise,1);


% standart polyfit
tic
p = polyfit(x,y,1);
toc

% linear regression;
tic
[lg,  con_lg, r, con_r] = linearReg(x,y)
toc

% correlation
tic
[r_ref, ~, rl, ru] = corrcoef(x,y);
toc

con_r_ref = [rl(1,2) r_ref(1,2) ru(1,2)]


figure
plot(x,y,'.')
hold all;
plot(xl, polyval(p, xl));
plot(xl, polyval(lg, xl));


