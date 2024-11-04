% td = 2*R / C
R = 450;
c = 3e8;
td = 2*R / c;

ts=1e-9;
T=1e-5;
tau=1e-6;

requiredTimeStepsSending=round(tau/ts);
signal = zeros(size(t));
signal(1:requiredTimeStepsSending)=1;

requiredTimeStepsReceiving= round(td/ts);
recievedSignal=zeros(size(t));
recievedSignal(requiredTimeStepsReceiving+1:requiredTimeStepsReceiving+requiredTimeStepsSending)=0.5;

figure;
%plot(t,signal,'b');
grid on;

%hold on;
[findR, corrVal] = p3_3(recievedSignal);
fprintf("R is %d\n", p3_3(recievedSignal));
figure;
%plot(t,corrVal);
grid on;

%p3_4

noiseLevel=0:0.1:5;
estimationError=zeros(size(noiseLevel));

for i=1:size(noiseLevel,2)
    %fprintf("round %d", i);
    sumEstimationError = 0;
    % 200 times of simulation for each noise level
    for j=1:100
        noise = noiseLevel(i) * randn(size(recievedSignal));
        noisySignal = recievedSignal + noise;
        estimation = p3_3(noisySignal);
        sumEstimationError = sumEstimationError + abs(estimation-450);
    end
    estimationError(i)=sumEstimationError/100;
    %fprintf("estimation error of round %d is %d", i, estimationError(i));
end

figure;
plot(noiseLevel, estimationError);
xlabel('Noise Power(Based On Standard Deviation)');
ylabel('estimation Error(m)');
grid on;
