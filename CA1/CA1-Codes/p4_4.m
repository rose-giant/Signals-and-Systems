function p4_4(fileName, speed)
       [voice, fq] = audioread(fileName);
       newSignal = zeros(round(size(voice,1)/speed),2);
  
    if (speed <= 2 && speed >= 0.5)
       newSignal(1)=voice(1);

       for i=1:size(newSignal, 1)
        newSignal(i)=(voice(floor(i*speed))+voice(ceil(i*speed)))/2;
       end

       %sound(voice, fq * speed);
       sound(newSignal, fq);
    else
        error("enter a valid speed bro!");
    end
end