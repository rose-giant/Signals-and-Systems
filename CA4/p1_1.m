fs = 100;

% Speed = 3
signal3x = coding_amp('signal', 3);
t1 = 0:1/fs:(size(signal3x, 2)-1)/fs;
plot(t1,signal3x);
title('speed = 3');

msg1 = decoding_amp(signal3x, 3);
fprintf("Extracted Message from Signal is %s\n", msg1);

% Speed = 2
signal2x = coding_amp('signal', 2);
t2 = 0:1/fs:(size(signal2x, 2)-1)/fs;
figure;
plot(t2,signal2x);
title('speed = 2');

msg2 = decoding_amp(signal2x, 2);
fprintf("Extracted Message from Signal is %s\n", msg2);

% Speed = 1
signal1x = coding_amp('signal', 1);
t3 = 0:1/fs:(size(signal1x, 2)-1)/fs;
figure;
plot(t3,signal1x);
title('speed = 1');

msg3 = decoding_amp(signal1x, 1);
fprintf("Extracted Message from Signal is %s\n", msg3);
