function signal = coding_amp(msg, speed)
   % msg = 'signal';
    bitRate = 1;
    characters = ['a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'o' 'p' 'q' 'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z' ' ' '.' ',' '!' '"' ';'];
    correspondingNums = 0:1:31;
    correspondingBins = dec2bin(correspondingNums);

    MapSet = cell(2,32);
    for i=1:32
        MapSet{1,i} = characters(i);
        MapSet{2,i} = correspondingBins(i, :);
    end

    binMsg = [];
    for i = 1:size(msg,2)
        for j=1:size(MapSet, 2)
            charIndex = find(characters == msg(i));
            if (msg(1, i) == MapSet{1, j})
                binMsg = [binMsg, MapSet{2, j}];
            end
        end
    end

    disp(binMsg);
    signal = signal_gen(binMsg, speed);
end

