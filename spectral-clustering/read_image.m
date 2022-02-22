function I = read_image(file_name, rows)
    
    I = imread(file_name); %rgb
    
    if rows ~= -1
        [h, w, channels] = size(I);

        %if (channels > 1)
        %    I = double(rgb2gray(I));
        %else
        %    I = double(I);
        %end

        I = imresize(I, [rows NaN], 'bicubic');
    end
    
end