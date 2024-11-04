function detector(image)
    imageMatrix = imresize(image,[NaN 800]);
    %imshow(imageMatrix);
    
    grayimage = mygrayfunc(imageMatrix);
    %imshow(grayimage);
    
    threshold= 255*graythresh(grayimage);
    binaryimage=mybinaryfun(grayimage, threshold);
    
    %DO NOT CHANGE THE 130
    %I BLED, SWEATED AND CRIED TO REACH IT
    cleanimage = myremovecom(binaryimage,380);
    %imshow(cleanimage);
    background=myremovecom(binaryimage,7000);
    %imshow(background);
    finalimage=logical(cleanimage-background);
    %imshow(finalimage);
    
    [label,num] = mysegmentation(finalimage);
    
    imshow(finalimage);
    folder='p2\Map Set';
    filelist = dir(folder);
    mapset=cell(2,size(filelist,1)-2);
    
    filesize = size(filelist, 1);
    fprintf("file size is %d\n", filesize);
    
    for i=3:filesize
        filename=fullfile(folder,filelist(i).name);
        mapset{1,i-2}=imread(filename);
        name=filelist(i).name;
        for j=1:length(name)
            if(name(j)=='.')
                break;
            end
        end
        mapset{2,i-2}=name(1:j-1);
    end
    
    corrthreshold = 3450;
    result=[];
    for i=1:num
            [row,col]=find(label==i);
            thissegment=finalimage(min(row):max(row),min(col):max(col));
            thissegment=imresize(thissegment,[84 48]);
            corr=zeros(1,size(mapset,2));
           
            for j=1:size(mapset,2)
                newmat=~bitxor(thissegment,mapset{1,j});
                corr(j)=sum(newmat,'all');
            end
            
            [corrval,index]=max(corr);
            if(corrval>corrthreshold)
                result=[result mapset{2,index}];
            end
    end
    
    fprintf('%s',result);
    file = fopen('persian_result.txt', 'wt');
    fprintf(file,'%s\n',result);
    fclose(file);

end