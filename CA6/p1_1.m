
tStart = 0;
tEnd = 1;
fs = 100;
fc = 5;
signalLen = tStart : 1/fs : tEnd - 1/fs;
signal1 = cos(2 * pi * fc * signalLen);

signalPlotter(signal1, signalLen);