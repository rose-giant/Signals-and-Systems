ts=1e-9;
T=1e-5;
tau=1e-6;
% below the time vector is initialized as it starts from 0 and taks steps
% as long as ts until it reaches T
t=0:ts:T;

requiredTimeSteps=round(tau/ts);

sentSignal=zeros(size(t));
sentSignal(1:requiredTimeSteps)=1;

figure;
plot(t,sentSignal,'b');
grid on;