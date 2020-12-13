N = 1000;       % number of samples
s = linspace(0,1,N); % select a large number of sample savings rate
delta = 0.1; % depreciation rate of capital
%
% compute steady state capital, consumption, investment and output per worker
% 
k = (s/delta).^2;
y = k.^0.5;
i = s.*y;
c = (1-s).*y;
%
% compute approximation of the golden rule capital, consumption per worker and savings rate
% display the result
%
[c_gold,s_index] = max(c);
s_gold = s(s_index);
k_gold = (s_gold/delta)^2;
res = sprintf(' an approximation of the golden rule consumption per worker = %f\n an approximation of the golden rule savings rate =  %f\n an approximation of the golden rule capital per worker =  %f',c_gold,s_gold,k_gold)
disp(res)
%
% ploting graphs
%
figure(1)
plot(k,c,k,i,k,y)
legend({'consumption per worker','investment per worker','output per worker'},'Location','best');
legend('boxoff');
xlabel('capital per worker');
title('Per capita steady rate consumption,investment and output function');
figure(2)
plot(s,c,s,i,s,y)
legend({'consumption per worker','investment per worker','output per worker'},'Location','best');
legend('boxoff');
xlabel('savings rate');
title('Per capital steady rate consumption,investment and output function versus savings rate');