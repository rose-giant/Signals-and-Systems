function result = make_audio(frequency, range_time, first_half, second_half)
    tstart = 0;
    tend = 0.5;
    fs = 8000;
    ts = 1/fs;
    rest = 0.025;
    no_samples = tend*fs;
    no_rest_samples = rest*fs;
    
    no_periods = 8*4;
    
    f = frequency;
    
    audio = zeros(1, no_periods*tend*fs);
    if (first_half == "full") && (second_half == "full")
        t_full = no_samples*(range_time-1)+1:no_samples*(range_time) ...
            - no_rest_samples;
        t = tstart:ts:tend-ts-rest;
        audio(1, t_full) = sin(2*pi*frequency*t);
        result = audio;
    elseif (first_half == "full") && (second_half == "empty")
        t_full = no_samples*(range_time-1)+1:no_samples*(range_time ...
            - 0.5)-no_rest_samples;
        t = tstart:ts:tend/2-ts-rest;
        audio(1, t_full) = sin(2*pi*frequency*t);
        result = audio;
    elseif (first_half == "empty") && (second_half == "full")
        t_full = no_samples*(range_time-0.5)+1:no_samples*(range_time) ...
            - no_rest_samples;
        t = tstart:ts:tend/2-ts-rest;
        audio(1, t_full) = sin(2*pi*frequency*t);
        result = audio;
    end
end