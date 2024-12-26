function signalPlotter(signal)
    tStart = 0;
    tEnd = 1;
    fs = 100;
    
    signalLen = tStart : 1/fs : tEnd - 1/fs;

    figure;
    plot(signalLen, signal);
    title("signal:");
    grid on;
end