r1 = 250000;
v1 = 180 / 3.6;
alpha1 = 0.5;
fd1 = beta * v1;
td1 = P * r1;

r2 = 200000;
v2 = 216 / 3.6;
alpha2 = 0.6;
fd2 = beta * v2;
td2 = P * r2;

tStart = 0;
tEnd = 1;
fc = 5;
fs = 100;
lightSpeed = 3e8;
P = 2 / lightSpeed;
beta = 0.3;

t = tStart: 1/fs: tEnd-1/fs;
signal = alpha1 * cos(2 * pi * (fd1 + fc) * (t - td1)) + alpha2 * cos(2 * pi * (fd2 + fc) * (t - td2));

figure;
plot(t, signal);
title("signal")
grid on

fds = zeros(1, 2);
tds = zeros(1, 2);
vs = zeros(1, 2);
Rs = zeros(1, 2);

fourierTransform = fftshift(fft(signal));
[peaks, locs] = findpeaks(abs(fourierTransform));
[peaks, index] = sort(peaks, 'descend');

locs = locs(index);
phase = angle(fourierTransform);

for i = 1:2
    fds(i) = abs(locs(2*i) - fs/2 - 1) - fc;
    tds(i) = abs(phase(locs(2*i))) / (2 * pi * (fds(i) + fc));
end

for i = 1:2
    vs(i) = fds(i) / beta;
    Rs(i) = tds(i) / P;
end

fprintf("R(1) = %f(km), v(1) = %f(km/h)\n", Rs(1) / 1000, vs(1) * 3.6);
fprintf("R(2) = %f(km), v(2) = %f(km/h)\n", Rs(2) / 1000, vs(2) * 3.6);