s=0.3;
delta=0.1;
k=linspace(0,20,100);
y=k.^0.5;
c=(1-s).*y;
i=s.*y;
dep=delta.*k;
figure(1)
plot(k,c,k,i,k,y,k,dep)
legend({'consumption per worker','investment per worker','output per worker','depreciation'},'Location','best');
legend('boxoff')
xlabel('capital per worker');
title('Per capita steady rate consumption,investment,depreciation and output function');