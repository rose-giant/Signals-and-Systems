t1 = 0:1/fs:(size(signal3x, 2)-1)/fs;
noisePower = 1/100;

signal3x = coding_amp('signal', 3);
t1 = 0:1/fs:(size(signal3x, 2)-1)/fs;
plot(t1,signal3x);
title('speed = 3');
noise3 = add_noise(noisePower, size(signal3x));
signal3x = signal3x + noise3;

hold on;
plot(t1,signal3x);
title('speed = 3 + Noise');


signal2x = coding_amp('signal', 2);
noise2 = add_noise(noisePower, size(signal2x));
signal2x = signal2x + noise2;

t2 = 0:1/fs:(size(signal2x, 2)-1)/fs;
figure;
plot(t2, signal2x);
title('speed = 2');

hold on;
plot(t2,signal2x);
title('speed = 2 + Noise');


signal1x = coding_amp('signal', 1);
noise1 = add_noise(1/100, size(signal1x));
signal1x = signal1x + noise1;

t3 = 0:1/fs:(size(signal1x, 2)-1)/fs;
figure;
plot(t3, signal1x);
title('speed = 1');

hold on;
plot(t3,signal1x);
title('speed = 1 + Noise');


message1 = decoding_amp(signal3x, 3);
fprintf('decoded message for speed 3: %s \n', message1);

message2 = decoding_amp(signal2x, 2);
fprintf('decoded message for speed 2: %s \n', message2);

message3 = decoding_amp(signal1x, 1);
fprintf('decoded message for speed 1: %s \n', message3);
