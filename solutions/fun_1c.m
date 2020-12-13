function F = fun_1c_lastest(x)
global T alpha delta beta sigma k0;
F(1) = (k0^alpha+(1-delta)*k0-x(1))^(-sigma)-beta*((1-delta)+alpha*x(1)^(alpha-1))*(x(1)^alpha+(1-delta)*x(1)-x(2))^(-sigma);
for t=2:T-1
F(t) = (x(t-1)^alpha+(1-delta)*x(t-1)-x(t))^(-sigma)-beta*((1-delta)+alpha*x(t)^(alpha-1))*(x(t)^alpha+(1-delta)*x(t)-x(t+1))^(-sigma);
end
F(T) = (x(T-1)^alpha+(1-delta)*x(T-1)-x(t))^(-sigma)-beta*((1-delta)+alpha*x(T)^(alpha-1))*(x(T)^alpha+(1-delta)*x(T))^(-sigma);