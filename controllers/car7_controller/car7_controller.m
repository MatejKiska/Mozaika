% MATLAB controller for Webots
% File:          car1_controller.m
% Date:
% Description:
% Author:
% Modifications:

% uncomment the next two lines if you want to use
% MATLAB's desktop to interact with the controller:
%desktop;
%keyboard;

TIME_STEP = 64;

diff_x = 0.16;

meter = 38;

diff_y = 0.4;

margin = 1;

index = 7;

speed = 5;

input = imread('input.png');

img_resized_rgb = imresize(input,[10 10]);

source = 1 - imbinarize(img_resized_rgb,0.4);

dist = zeros(sum(source(:,index,1)),1);

y = 1;

for x = 1:size(source,1)
  if source(x,index,1) == 1
    dist(y,1) = (diff_x*(10-x)+margin+diff_y*(10-index))*meter;
    y = y + 1;
  end
end

% get and enable devices, e.g.:
%  camera = wb_robot_get_device('camera');
%  wb_camera_enable(camera, TIME_STEP);
motor_left = wb_robot_get_device('motor_left7');
motor_right = wb_robot_get_device('motor_right7');

ds = wb_robot_get_device('dist_sensor7');

wb_distance_sensor_enable(ds,TIME_STEP);

% main loop:
% perform simulation steps of TIME_STEP milliseconds
% and leave the loop when Webots signals the termination
%

i = 0;
while wb_robot_step(TIME_STEP) ~= -1
  distance = wb_distance_sensor_get_value(ds); 
  if distance < 128 && i < size(dist,1)
    length = dist(i+1,1);
    timer = 1000*length/speed;
    wb_motor_set_position(motor_left,length);
    wb_motor_set_velocity(motor_left,speed);
    wb_motor_set_position(motor_right,length);
    wb_motor_set_velocity(motor_right,speed);
    wb_robot_step(timer);
    wb_motor_set_position(motor_left,0);
    wb_motor_set_position(motor_right,0);
    wb_robot_step(timer);
    i = i + 1;
  end
  % Process here sensor data, images, etc.

  % send actuator commands, e.g.:
  %  wb_motor_set_postion(motor, 10.0);

  % if your code plots some graphics, it needs to flushed like this:
  drawnow;

end

% cleanup code goes here: write data to files, etc.