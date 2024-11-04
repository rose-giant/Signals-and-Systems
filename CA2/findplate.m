function rectmax=findplate(image)
    bluestrip = imread('p3\bluestrip_big.png');
    bluestrip = imresize(bluestrip, [NaN 80]);
    bluestrips = generatebluestrips(bluestrip);
    totalmax=0;
    for i=1:30
        [maxcorrval,rect]=findtemplatecorr(bluestrips{1,i}, image);
        if(maxcorrval>totalmax)
            totalmax=maxcorrval;
            rectmax=rect;
        end
    end

    figure
    imshow(image);
    rectangle('Position',[rectmax(2) rectmax(1) rectmax(4) rectmax(3)],...
             'EdgeColor','g','LineWidth',2);

    rectmax = [rectmax(1)-10
            rectmax(2)-10
            rectmax(3)+20
            rectmax(4)*13];
    figure
    imshow(image);
    rectangle('Position',[rectmax(2) rectmax(1) rectmax(4) rectmax(3)],...
        'EdgeColor','g','LineWidth',2);
end

