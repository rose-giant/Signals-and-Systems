function decrypted = decoding(codedimage, mapset)
    endChar = ';';
    endCharBin = '00000';
    for i=1:size(mapset,2)
        if(mapset{1,i} == endChar)
            endCharBin = mapset{2,i};
        end
    end
  
    binaryimg = [];
    stop = false;
   
    for j=1:size(codedimage, 2)
        if(stop == true)
            break;
        end

        for i=1:size(codedimage, 1)
            pixel = codedimage(i, j);
            binPix = dec2bin(pixel, 8);
            binaryimg = [binaryimg, binPix(8)];

            if(mod(size(binaryimg,2), 5) == 0)
                sz = size(binaryimg,2);
                if(binaryimg(1,sz-4:sz) == endCharBin)
                    stop = true;
                    break;
                end
            end

        end

    end
    
    decrypted = [];
    
    for i=1:5:size(binaryimg,2)
        for j=1:size(mapset,2)
            if(binaryimg(i:i+4)==mapset{2,j})
                decrypted = [decrypted mapset{1,j}];
            end
        end  
    end

end