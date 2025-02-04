fs = 100;
t = tStart : 1/fs : tEnd - 1/fs;
fc = 5;

speed = 180 / 3.6;
radius = 250000;
beta = 0.3;
alpha = 0.5;
fd = beta * speed;
lightSpeed = 3e8;
P = 2 / lightSpeed;
td =  P * radius;
signal2 = alpha * cos(2 * pi * (fc+fd) * (t-td));
signalPlotter(signal2, t);

%% part 1-3: extraction of the signal parameters from the Fourier transform of the received signal

fourierTransform = fftshift(fft(signal2));
[maxValue, maxIndex] = max(abs(fourierTransform));

foundFd = abs(maxIndex - floor(fs / 2) - 1) - fc; 
foundSpeed = foundFd / beta;

phase = angle(fourierTransform);
foundTd = phase(maxIndex) / (2 * pi * (fd + fc));
foundRaduis = foundTd * lightSpeed / 2;

fprintf("estimated Speed(km/h): %f\n", foundSpeed * 3.6);
fprintf("estimated Radius(km): %f\n", foundRaduis / 1000);

%% part 1-4: add noise to the signal and check whether the parameters are accurately extracted

noise = randn(1, length(signal2));
noisePower = 0:0.05:2;
speedFault = zeros(1, length(noisePower));
bestVNoisePower = 0;
radiusFault = zeros(1, length(noisePower));
bestRNoisePower = 0;
threshold = 0.1;

for i = 1 : length(noisePower)
    thisNoisePower = noisePower(i);
    signal2 = alpha * cos(2 * pi * (fd + fc)*(t - td)) + thisNoisePower * noise;
    fourier = fftshift(fft(signal2));
    [maxValue, maxIndex] = max(abs(fourier));
    foundFd = abs(maxIndex - floor(fs / 2) - 1) - fc; 
    phase = angle(fourier);
    foundTd = phase(maxIndex) / (2 * pi * (fd + fc));
    foundV = foundFd / beta;
    foundR = foundTd * lightSpeed / 2;
    if (abs(foundV - speed) < threshold * speed)
        bestVNoisePower = thisNoisePower;
    end
    if (abs(foundR - radius) < threshold * radius)
        bestRNoisePower = thisNoisePower;
    end
    speedFault(i) = abs(foundV - speed) * 3.6;
    radiusFault(i) = abs(foundR - radius) / 1000;
end

fprintf("last noise standard derivation for v is: %f\n", bestVNoisePower);
fprintf("last noise standard derivation for R is: %f\n", bestRNoisePower);

figure;
plot(noisePower, speedFault);
hold on
plot(noisePower, radiusFault);
ylabel("fault detected")
xlabel("noise standard derivation")
legend("speed fault detected", "rasius fault detected")