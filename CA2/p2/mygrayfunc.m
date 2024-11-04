
function grayimage = mygrayfunc(imageMatrix)
    grayimage = zeros(size(imageMatrix, 1), size(imageMatrix, 2));
    for i=1:size(imageMatrix,1)
        for j=1:size(imageMatrix, 2)
            graypixel = 0.299 * imageMatrix(i,j,1) + 0.578 * imageMatrix(i,j,2) + 0.114 * imageMatrix(i,j,3);
            grayimage(i,j) = graypixel;
        end
    end

    grayimage = uint8(grayimage);
end