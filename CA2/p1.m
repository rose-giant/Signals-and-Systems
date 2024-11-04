[file, path] = uigetfile({'*.jpg;*.jpeg;*.png'}, 'Enter the image address bro');
readImage = imread([path, file]);

imageMatrix = imresize(readImage, [300 500]);

grayimage = mygrayfunc(imageMatrix);

threshold= 255*graythresh(grayimage);
binaryimage=mybinaryfun(grayimage, threshold);

cleanimage= myremovecom(binaryimage,200);
[label,num] = mysegmentation(cleanimage);

imshow(cleanimage);

for i=1:num
    [row, col] = find(label==i);
    segment=cleanimage(min(row):max(row),min(col):max(col));
    rectangle('Position', [min(col),min(row),max(col)-min(col),max(row)-min(row)], 'EdgeColor', 'b', 'LineWidth', 2);
end

folder='p1\Map Set';
filelist = dir(folder);
mapset=cell(2,size(filelist,1)-2);
fileslen = size(filelist, 1);

for i=3:fileslen
    filename=fullfile(folder,filelist(i).name);
    mapset{1,i-2}=imread(filename);
    mapset{2,i-2}=filelist(i).name(1);
end

corrthreshold = 600;
result=[];

for i=1:num
    [row,col]=find(label==i);
    segment=cleanimage(min(row):max(row),min(col):max(col));
    segment=imresize(segment,[42 24]);
    corr=zeros(1,size(mapset,2));

    for j=1:size(mapset,2)
        newmat=~bitxor(segment,mapset{1,j});
        corr(j)=sum(newmat,'all');
    end

    [corrval,index]=max(corr);
    if(corrval>corrthreshold)
        result=[result mapset{2,index}];
    end
end

fprintf('result is %s\n',result);
file = fopen('result.txt', 'wt');
fprintf(file,'%s\n',result);
fclose(file);