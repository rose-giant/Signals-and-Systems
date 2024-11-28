function msg = decoding_amp(signal, speed)
    
    fs = 100;
    t = 0:1/fs:0.99;
    comparingSignal = sin(2*pi*t);
    corrValues = [];

    for i=1:fs:size(signal, 2)
        signalSegment = signal(i:i+fs-1);
        correlation = dot(signalSegment, comparingSignal);
        corrValues = [corrValues 2/100 * correlation];
    end

    thresholds = zeros(1, 2^speed-1);
    for i=0:2^speed-2
        thresholds(i+1) = i + 1/2;
    end

    binMsg = [];
    for i=1:size(corrValues, 2)
        corrVal = corrValues(i) * (2^speed - 1);
        findEx = 2^speed-1;
        for j=1:size(thresholds, 2)
            if(corrVal < thresholds(j))
                findEx = j-1;
                break;
            end
        end
        binMsg = [binMsg dec2bin(findEx, speed)];
    end

    msg = revert_msg(binMsg);

end
