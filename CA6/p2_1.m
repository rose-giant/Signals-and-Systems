fG = 783.99;
fFSharp = 739.99;
fE = 659.25;
fD = 587.33;

tstart = 0;
tend = 0.5;
fs = 8000;
ts = 1/fs;
rest = 0.025;

no_periods = 8*4;
ttotalend = no_periods*tend;
t = tstart:ts:ttotalend-ts;

audio = zeros(1, no_periods*tend*fs);

audio = audio + make_audio(fG, 2, "full", "full");

audio = audio + make_audio(fFSharp, 3, "full", "full");
audio = audio + make_audio(fFSharp, 7, "full", "empty");
audio = audio + make_audio(fFSharp, 11, "full", "full");
audio = audio + make_audio(fFSharp, 15, "full", "empty");
audio = audio + make_audio(fFSharp, 19, "full", "full");
audio = audio + make_audio(fFSharp, 23, "full", "full");
audio = audio + make_audio(fFSharp, 27, "full", "empty");
audio = audio + make_audio(fFSharp, 28, "full", "full");
audio = audio + make_audio(fFSharp, 29, "full", "empty");
audio = audio + make_audio(fFSharp, 30, "full", "full");
audio = audio + make_audio(fFSharp, 31, "full", "full");

audio = audio + make_audio(fE, 5, "empty", "full");
audio = audio + make_audio(fE, 6, "full", "empty");
audio = audio + make_audio(fE, 8, "full", "full");
audio = audio + make_audio(fE, 10, "full", "full");
audio = audio + make_audio(fE, 12, "full", "full");
audio = audio + make_audio(fE, 13, "empty", "full");
audio = audio + make_audio(fE, 14, "full", "empty");
audio = audio + make_audio(fE, 16, "full", "full");
audio = audio + make_audio(fE, 18, "full", "empty");
audio = audio + make_audio(fE, 20, "full", "full");
audio = audio + make_audio(fE, 22, "full", "empty");
audio = audio + make_audio(fE, 24, "full", "full");
audio = audio + make_audio(fE, 26, "full", "full");
audio = audio + make_audio(fE, 27, "empty", "full");
audio = audio + make_audio(fE, 29, "empty", "full");

audio = audio + make_audio(fD, 1, "full", "empty");
audio = audio + make_audio(fD, 1, "empty", "full");
audio = audio + make_audio(fD, 4, "full", "full");
audio = audio + make_audio(fD, 5, "full", "empty");
audio = audio + make_audio(fD, 6, "empty", "full");
audio = audio + make_audio(fD, 7, "empty", "full");
audio = audio + make_audio(fD, 9, "full", "full");
audio = audio + make_audio(fD, 13, "full", "empty");
audio = audio + make_audio(fD, 14, "empty", "full");
audio = audio + make_audio(fD, 15, "empty", "full");
audio = audio + make_audio(fD, 17, "full", "full");
audio = audio + make_audio(fD, 18, "empty", "full");
audio = audio + make_audio(fD, 21, "full", "full");
audio = audio + make_audio(fD, 22, "empty", "full");
audio = audio + make_audio(fD, 25, "full", "empty");
audio = audio + make_audio(fD, 25, "empty", "full");
audio = audio + make_audio(fD, 32, "full", "full");

audiowrite('sound.wav', audio, fs);
[y, Fs] = audioread('sound.wav');
sound(y, Fs);