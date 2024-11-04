characters = ['a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'o' 'p' 'q' 'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z' ' ' '.' ',' '!' '"' ';'];
correspondingNums = 0:1:31;
correspondingBins = dec2bin(correspondingNums);

%fprintf("it is %s", correspondingBins);

MapSet = cell(2,32);
for i=1:32
    MapSet{1,i} = characters(i);
    MapSet{2,i} = correspondingBins(i, :);
end

prompt = "What is the text? ";
inputmessage = input(prompt, "s");
%fprintf("x is %s", inputmessage);

[file, path] = uigetfile({'*.jpeg;*.jpg;*.bmp;*.png;*.tif'}, 'Choose a Black and White Image Bro:');
image = imread([path, file]);
if(size(image, 3) ~= 1)
    image = rgb2gray(image);
end

%coded = coding(inputmessage, image, MapSet);
coded = coding2(inputmessage, image, MapSet);

decoded = decoding(coded, MapSet);
fprintf('decoded message is %s', decoded);
