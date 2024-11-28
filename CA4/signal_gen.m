function signal = signal_gen(binMsg, speed)
    signal = [];
    fs = 100;
    t = 0:1/fs:0.99;
    %step with the speed and generate the signal
    for i=1:speed:size(binMsg, 2)
        step = binMsg(i:i+speed-1);
        appendingSignal = 1/(2^speed-1)*sin(2*pi*t) * bin2dec(step);
        signal = [signal appendingSignal];
    end
end