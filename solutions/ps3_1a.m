%
% Setting up Cass-Koopmans model 
%
clear 
T=1;% period
alpha = 0.3;   % capital share of income
delta = 0.1;  % depreciation rate of capital
k0=0.01*ones(T+2,1);  % set initial value for k
k0(T+2)=0;   % set initial value for k
k=fsolve(@fun_1a,k0);
%
% Compute consumption
%
c=zeros(T+1,1);
for t=1:T+1
c(t)=k(t)^alpha+(1-delta)*k(t)-k(t+1);
end
%
% Display numerical results
%
disp(c)
disp(k)