clc, clear

input = imread('input.png');

img_resized_rgb = imresize(input,[10 10]);

source = 1 - imbinarize(img_resized_rgb,0.4);

index = 1;

output = char("motor_left"+num2str(index))
