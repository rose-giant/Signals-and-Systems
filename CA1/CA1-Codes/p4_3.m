function p4_3(fileName, speed)

    if (speed == 2)
       [voice, fq] = audioread(fileName);
       zeroMatrix = zeros(round(size(voice,1)/2),2);

       for i=1:size(zeroMatrix, 1)
            zeroMatrix(i)=voice(2*i);
       end

       %sound(voice, fq * speed);
       sound(zeroMatrix, fq);
    elseif(speed == 0.5 )
        [voice, fq] = audioread(fileName);
        zeroMatrix = zeros(round(size(voice,1)*2),2);

        for i=1:size(voice, 1)
            zeroMatrix(2*i) = voice(i);
            zeroMatrix(2*i-1) = voice(i) + voice(i+1) / 2;
        end

        sound(zeroMatrix, fq);
        %sound(voice, fq * speed);
    else
        error("enter a valid speed bro!");
    end
end