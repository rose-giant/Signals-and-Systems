[file, path] = uigetfile({'*.jpeg;*.jpg;*.bmp;*.png;*.tif'}, 'Choose the Persian plate image bro');
image = imread([path, file]);

%imshow(image);

detector(image);