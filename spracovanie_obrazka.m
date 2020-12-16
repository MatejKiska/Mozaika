clc, clear

input = imread('input.jpg');


img_resized_rgb = imresize(input,[50 50]);

img_resized_gray = im2gray(img_resized_rgb);



for i = 1:numel(img_resized_gray)
    if img_resized_gray(i) <= 26
        img_resized_gray(i) = 0;
    elseif img_resized_gray(i) <= 77 & img_resized_gray(i)>= 27
            img_resized_gray(i) = 51;
    elseif img_resized_gray(i) <= 127 & img_resized_gray(i)>= 78
            img_resized_gray(i) = 102;
    elseif img_resized_gray(i) <= 178 & img_resized_gray(i)>= 128
            img_resized_gray(i) = 153;
    elseif img_resized_gray(i) <= 229 & img_resized_gray(i)>= 179
            img_resized_gray(i) = 204;
    elseif img_resized_gray(i) <= 255 & img_resized_gray(i)>= 230
            img_resized_gray(i) = 255;
        
        
        
    end

    
end
imshow(img_resized_gray)