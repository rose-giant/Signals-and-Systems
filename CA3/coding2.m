function Y = coding2(message, grayImage, mapset)

    message_len=length(message);
    message_bin=cell(1,message_len);

    for i=1:message_len
        ch=message(i);
        index=strcmp(ch,mapset(1,:));
        message_bin{i}=mapset{2,index};
    end
    
    binarymessage=cell2mat(message_bin);
    binarymessage_len=length(binarymessage);
    Y=grayImage;
    
    for i=1:binarymessage_len
       vals=grayImage(i); 
       valsbin=dec2bin(vals);
       valsbin1=valsbin;
       valsbin1(end)=binarymessage(i);
       Y(i)=bin2dec(valsbin1);    
    end

    subplot(1,2,1)
    imshow(grayImage)
    title('Original PIC')
    subplot(1,2,2)
    imshow(Y)
    title('Coded PIC')

end