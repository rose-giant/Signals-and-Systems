[audio, fs] = audioread('sound.wav');

frameDuration = 0.25;
frameSize = round(frameDuration * fs);
numFrames = floor(length(audio) / frameSize);
notes = [];

noteNames = {'G', 'F#', 'E', 'D',};
frequencies = [783.99, 739.99, 659.25, 587.33];
noteMap = containers.Map(frequencies, noteNames);

rest = 0.025;
numRestNodes = rest * fs;

% Analyze each frame
for i = 1:numFrames
    frame = audio((i-1)*frameSize + 1 : i*frameSize);
    
    windowedFrame = frame .* hamming(frameSize);
    
    fftResult = fft(windowedFrame);
    magnitude = abs(fftResult(1:floor(frameSize/2)));
    freqAxis = (0:floor(frameSize/2)-1) * fs / frameSize;
    
    [~, peakIndex] = max(magnitude);
    dominantFreq = freqAxis(peakIndex);
    
    [~, closestIndex] = min(abs(frequencies - dominantFreq));
    detectedNote = noteMap(frequencies(closestIndex));
    
    notes = [notes; {(i-1) * frameDuration, i * frameDuration, ...
            detectedNote}];
end

disp('Time (s)    Note');
disp(notes);

