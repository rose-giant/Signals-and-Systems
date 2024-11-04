function findic(PCBImage, ICImage)
    rotatedIC = imrotate(ICImage, 180);
    corrThr = 0.95;
    foundIdx = [];

    for i=1:size(PCBImage,1)-size(ICImage,1)
        for j=1:size(PCBImage,2)-size(ICImage,2)

            takeICSizeOut = PCBImage(i:i+size(ICImage,1)-1,j:j+size(ICImage,2)-1, :);
            corrValueR = normcorr(ICImage(:,:,1), takeICSizeOut(:,:,1));
            corrValueG = normcorr(ICImage(:,:,2), takeICSizeOut(:,:,2));
            corrValueB = normcorr(ICImage(:,:,3), takeICSizeOut(:,:,3));

            corrValue = (corrValueR+corrValueG+corrValueB)/3;
           
            rotatedCorrValueR = normcorr(rotatedIC(:,:,1), takeICSizeOut(:,:,1));
            rotatedCorrValueG = normcorr(rotatedIC(:,:,2), takeICSizeOut(:,:,2));
            rotatedCorrValueB = normcorr(rotatedIC(:,:,3), takeICSizeOut(:,:,3));
            
            rotatedCorrValue=(rotatedCorrValueR+rotatedCorrValueG+rotatedCorrValueB)/3;

            if((corrValue > corrThr) || (rotatedCorrValue > corrThr))
                foundIdx = [foundIdx [i; j]];
            end
        end
    end

    subplot(1,2,1);
    imshow(PCBImage);
    subplot(1,2,2);
    imshow(ICImage);
    figure;
    imshow(PCBImage);

    for i=1:size(foundIdx, 2)
        rect = [foundIdx(2,i)
                foundIdx(1,i)
                size(ICImage, 2)
                size(ICImage, 1)];
        rectangle('Position', rect, 'EdgeColor','g','LineWidth',2);
    end

end