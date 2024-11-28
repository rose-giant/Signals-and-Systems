function noise = add_noise(power, noise_len)
    x = noise_len;
    %fprintf("noise len is %d\n", x);
    noise = power * randn(x);
   % histfit(noise);
    mean = sum(noise)/length(noise);
    variance = sum(noise.*noise)/length(noise) - mean^2;

    fprintf('calculated mean on randn function is: %f \n', mean);
    fprintf('calculated variance on randn function is: %f \n', variance);

end
