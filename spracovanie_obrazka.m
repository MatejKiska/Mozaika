clc, clear

input = imread('input.png');


img_resized_rgb = imresize(input,[10 10]);

img_resized_vector = im2bw(img_resized_rgb,0.4);


imshow(img_resized_vector)