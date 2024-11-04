function codedPic = coding(message, grayImage, mapset)
    wordBinaryLength = size(mapset{2,1}, 2);
    pixelsNeeded = wordBinaryLength * size(message, 2);
    totalPixels = size(grayImage,1) * size(grayImage, 2);
  
    if(pixelsNeeded > totalPixels)
        codedPic = NaN;
        return;
    end
  
    binarymessage = [];
    for i=1:size(message,2)
        for j=1:size(mapset,2)
            if(message(1,i)==mapset{1,j})
                binarymessage = [binarymessage mapset{2,j}];
            end
        end
    end
    
    for i=1:size(binarymessage, 2)
        [row, col] = ind2sub(size(grayImage), i);
        pixel = grayImage(row,col);
        binPix = dec2bin(pixel, 8);
        binPix(8) = binarymessage(1,i);
        grayImage(row,col) = bin2dec(binPix);
    end
    
    codedPic = grayImage;
end