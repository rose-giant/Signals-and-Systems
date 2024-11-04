function [maxcorrval, rect] = findtemplatecorr(template, image)
    Rcorrval1=normxcorr2(template(:,:,1),image(:,:,1));
    Gcorrval1=normxcorr2(template(:,:,2),image(:,:,2));
    Bcorrval1=normxcorr2(template(:,:,3),image(:,:,3));
    corrval=(Rcorrval1+Gcorrval1+Bcorrval1)/3;
    [maxcorrval,maxindex]=max(abs(corrval(:)));
    [X,Y] = ind2sub(size(corrval),maxindex);
    Xoffset = X - size(template,1);
    Yoffset = Y - size(template,2);
    rect = [Xoffset,Yoffset,size(template,1),size(template,2)];
end