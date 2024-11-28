function msg = revert_msg(binMsg)

    characters = ['a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'o' 'p' 'q' 'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z' ' ' '.' ',' '!' '"' ';'];
    correspondingNums = 0:1:31;
    correspondingBins = dec2bin(correspondingNums);

    MapSet = cell(2,32);
    for i=1:32
        MapSet{1,i} = characters(i);
        MapSet{2,i} = correspondingBins(i, :);
    end

    msg = [];
    for i=1:5:size(binMsg,2)
        for j=1:size(MapSet,2)
            if(binMsg(i:i+4)==MapSet{2,j})
                msg = [msg MapSet{1,j}];
            end
        end  
    end
end