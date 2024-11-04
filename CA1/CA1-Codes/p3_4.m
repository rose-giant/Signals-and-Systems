recievedSignal = zeros(size(t));
recievedSignal(1:1000)=1;

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