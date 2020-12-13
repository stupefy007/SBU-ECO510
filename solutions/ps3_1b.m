%
% Setting up Cass-Koopmans model 
%
clear
T=2;% period
alpha = 0.3;    % capital share of income
delta = 0.1;    % depreciation rate of capital
beta = 0.96;    % set discount factor
k0=0.01*ones(T+2,1);  % set initial value for k
k0(T+2)=0;   % set initial value for k
k=fsolve(@fun_1b,k0);
%
% Compute consumption and savings rate
%
c=zeros(T+1,1);
s=zeros(T+1,1);
for t=1:T+1
c(t)=k(t)^alpha+(1-delta)*k(t)-k(t+1);
s(t)=1-c(t)/(k(t)^alpha);
end
%
% Display numerical results
%
disp(c)
disp(k)
disp(s)