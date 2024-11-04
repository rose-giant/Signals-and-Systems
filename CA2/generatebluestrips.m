function bluestrips = generatebluestrips(bluestrip)
    bluestrips=cell(1,40);
    for i=1:40
        bluestrips{i}=imresize(bluestrip,[NaN size(bluestrip,2)-2*i+2]);
    end
end