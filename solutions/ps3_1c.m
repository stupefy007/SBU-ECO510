%
% Setting up Cass-Koopmans model
%
clear
global T alpha delta beta sigma k0 k_last;   % Share Global Variable Between Function and Command Line
T=200;% period
alpha = 0.3;    % capital share of income
delta = 0.1;    % depreciation rate of capital
beta = 0.96;    % set discount factor
sigma = 2;      % parameter for uitility function
k0 = 0.01;      % set initial value for k
k_last=0;       % set terminal value for k
x0=0.1*ones(T,1);  % set initial value for k


%
% Compute capital, consumption and savings rate
%
sol = fsolve(@fun_1c,x0);
k=zeros(T+2,1);
c=zeros(T+2,1);
s=zeros(T+2,1);
k(1)=k0; 
k(2:T+1)=sol;
k(T+2)=k_last; % set terminal value for k
for t=1:T+1
c(t)=k(t)^alpha+(1-delta)*k(t)-k(t+1);
s(t)=1-c(t)/(k(t)^alpha);
end
%
% ploting graph
%  
x = 1:T+2;
c(T+2)=0;
s(T+2)=0;
figure(1)
plot(x,k,x,c,x,s)
legend({'capital per worker','consumption per worker','savings rate'},'Location','best')
legend('boxoff')
xlabel('periods');

