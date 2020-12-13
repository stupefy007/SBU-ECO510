%
% Setting up model
%
clear
N = 1200;  % the number of gridpoint
alpha = 0.3;    % capital share of income
delta = 0.1;    % depreciation rate of capital
beta = 0.96;    % set discount factor
epsilon = 0.00001;   % the tolerance level
k_min = 0.0001; % the lower bound of initial capital
k_star = ((1/beta-1+delta)/alpha)^(1/(alpha-1));
k_max = 3*k_star; % the upper bound of initial capital
k_grid = transpose(linspace(k_min,k_max,N));  %  Discretize the state space
V_guess = zeros(N,1);   % Denote value function V_guess
g_k = zeros(N,1);  % Denote policy function g^k
g_c = zeros(N,1);  % Denote policy function g^c
g_i = zeros(N,1);  % Denote policy function g^i
g_o = zeros(N,1);  % Denote policy function g^o
tmp = zeros(N,1);   % transition vector
k_0 = 0;    % transition variable
idx = 0;    % index variable
V_implied = 100*ones(N,1);  % set initial value function V_implied
%
% Compute value and policy function V_implied,g_k,g_c
%
while max(abs(V_guess-V_implied))>epsilon
    V_guess = V_implied;
    for t = 1:N
    k_0 = k_grid(t);
        for i=1:N
            if k_0^alpha-k_grid(i)+(1-delta)*k_0<=0
                tmp(i)=-inf;
            else
                tmp(i)=log(k_0^alpha-k_grid(i)+(1-delta)*k_0)+beta*V_guess(i);
            end
        end
    [V_implied(t),idx] = max(tmp);
    g_k(t) = k_grid(idx);
    g_c(t) = k_0^alpha-k_grid(idx)+(1-delta)*k_0;
    end
end
%
% Find out the path of capital, consumption, investment and output
%
k_path = zeros(101,1);
k_path(1)=g_k(1);
for i=1:100
    tmp = find(k_grid==k_path(i));
    k_path(i+1)=g_k(tmp);
end
for i=1:100
    y_path(i) = k_path(i)^alpha;
    c_path(i) = k_path(i)^alpha+(1-delta)*k_path(i)-k_path(i+1);
    i_path(i) = y_path(i)-c_path(i);
end
%
% ploting multiple graphs
%
figure(1)
plot(k_grid,V_implied)
legend({'value function V'},'Location','best')
legend('boxoff')
xlabel('capital');
figure(2)
plot(k_grid,g_c)
legend({'policy function for consumption'},'Location','best')
legend('boxoff')
xlabel('capital');
figure(3)
plot(k_grid,g_k)
legend({'policy function for capital'},'Location','best')
legend('boxoff')
xlabel('capital');
figure(4)
x=1:100;
plot(x,c_path,x,i_path,x,y_path)
legend({'consumption',' investment','output'},'Location','best')
legend('boxoff')
xlabel('periods');
