%
% set initial values for k0(captial per worker)
%
k0 = 4;
% k0 = 16;
% set value for the parameter of the model
alpha = 1/2;   % capital share of income
delta = 0.1;  % depreciation rate of capital
s = 0.3;      % savings rate 
T = 100;       % number of periods to simulate 
%
%  initialize time series and 
%  compute initial capital, consumption, investment and output per worker
%
k = zeros(T,1);
c = zeros(T,1);
i = zeros(T,1);
y = zeros(T,1);
k(1) = k0;
c(1) = (1-s)*k0^alpha;
i(1) = s*k0^alpha;
y(1) = k0^alpha;
%
% simulate model
%
for time = 1:T-1
    k(time+1,1) = (1-delta)*k(time,1)+s*k(time,1)^alpha;
    c(time+1,1) = (1-s)*k(time,1)^alpha;
    i(time+1,1) = s*k(time,1)^alpha;
    y(time+1,1) = k(time,1)^alpha;
end
%
% ploting graphs
%
x = 1:T;
figure(1)
plot(x,k,x,c,x,i,x,y)
legend({'capital per worker','consumption per worker','investment per worker','output per worker'},'Location','best')
legend('boxoff')
xlabel('periods');
title('Simulated time path of the capital, consumption, investment and output per worker')    