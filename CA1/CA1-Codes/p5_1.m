[x,fs] = audioread('song.wav');
fprintf('the sampling frequency is %d\n', fs);

%audiowrite("happyLittlePill.wav", x, fs);
%sound(x, fs);

plot(x);
title("Happy Little Pill Analysis")
xlabel("second")
ylabel("sample")
grid on

%p4_3('song.wav', 12);
p4_4('song.wav', 0.7);
