%
% Setting up model
%
clear
N = 300;  % the number of gridpoint
alpha = 0.3;    % capital share of income
delta = 0.1;    % depreciation rate of capital
beta = 0.96;    % set discount factor
k_min = 0.0001; % the lower bound of initial capital
k_star = ((1/beta-1+delta)/alpha)^(1/(alpha-1));
k_max = 3*k_star; % the upper bound of initial capital
k_grid = linspace(k_min,k_max,N);   %  Discretize the state space
V_1 = alpha*log(k_grid);   % Denote value function V_1(k)
%
% Compute value and policy function V_2,g_2k
%
for i = 1:N
    for j = 1:N
        c(i,j) = k_grid(i)^alpha+(1-delta)*k_grid(i)-k_grid(j);
        if c(i,j)<0
            w(i,j)=-inf;
        else
            w(i,j)=log(c(i,j))+beta*V_1(j);
        end
    end
    [V_2(i),k_best(i)] = max(w(i,:));
end
g_2k = k_grid(k_best);
%
% Compute value and policy function V_3,g_3k
%
for i = 1:N
    for j = 1:N
        c(i,j) = k_grid(i)^alpha+(1-delta)*k_grid(i)-k_grid(j);
        if c(i,j)<0
            w(i,j)=-inf;
        else
            w(i,j)=log(c(i,j))+beta*V_2(j);
        end
    end
    [V_3(i),k_best(i)] = max(w(i,:));
end
g_3k = k_grid(k_best);
%
% ploting multiple graphs
%  
figure(1)
plot(k_grid,g_2k);
legend({'policy function for capital'},'Location','best')
legend('boxoff')
xlabel('capital');
figure(2)
plot(k_grid,V_1,k_grid,V_2)
legend({'value function V1','value function V2'},'Location','best')
legend('boxoff')
xlabel('capital');
figure(3)
plot(k_grid,g_3k)
legend({'policy function for capital'},'Location','best')
legend('boxoff')
xlabel('capital');
figure(4)
plot(k_grid,V_1,k_grid,V_2,k_grid,V_3)
legend({'value function V1','value function V2','value function V3'},'Location','best')
legend('boxoff')
xlabel('capital');
