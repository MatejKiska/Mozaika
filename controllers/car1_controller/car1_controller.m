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

% get and enable devices, e.g.:
%  camera = wb_robot_get_device('camera');
%  wb_camera_enable(camera, TIME_STEP);
motor_left1 = wb_robot_get_device('motor_left1');
motor_right1 = wb_robot_get_device('motor_right1');

motor_left2 = wb_robot_get_device('motor_left2');
motor_right2 = wb_robot_get_device('motor_right2');

motor_left3 = wb_robot_get_device('motor_left3');
motor_right3 = wb_robot_get_device('motor_right3');

motor_left4 = wb_robot_get_device('motor_left4');
motor_right4 = wb_robot_get_device('motor_right4');

motor_left5 = wb_robot_get_device('motor_left5');
motor_right5 = wb_robot_get_device('motor_right5');

motor_left6 = wb_robot_get_device('motor_left6');
motor_right6 = wb_robot_get_device('motor_right6');

motor_left7 = wb_robot_get_device('motor_left7');
motor_right7 = wb_robot_get_device('motor_right7');

motor_left8 = wb_robot_get_device('motor_left8');
motor_right8 = wb_robot_get_device('motor_right8');

motor_left9 = wb_robot_get_device('motor_left9');
motor_right9 = wb_robot_get_device('motor_right9');

motor_left10 = wb_robot_get_device('motor_left10');
motor_right10 = wb_robot_get_device('motor_right10');

ds1 = wb_robot_get_device('dist_sensor1');
ds2 = wb_robot_get_device('dist_sensor2');
ds3 = wb_robot_get_device('dist_sensor3');
ds4 = wb_robot_get_device('dist_sensor4');
ds5 = wb_robot_get_device('dist_sensor5');
ds6 = wb_robot_get_device('dist_sensor6');
ds7 = wb_robot_get_device('dist_sensor7');
ds8 = wb_robot_get_device('dist_sensor8');
ds9 = wb_robot_get_device('dist_sensor9');
ds10 = wb_robot_get_device('dist_sensor10');

wb_distance_sensor_enable(ds1,TIME_STEP);
wb_distance_sensor_enable(ds2,TIME_STEP);
wb_distance_sensor_enable(ds3,TIME_STEP);
wb_distance_sensor_enable(ds4,TIME_STEP);
wb_distance_sensor_enable(ds5,TIME_STEP);
wb_distance_sensor_enable(ds6,TIME_STEP);
wb_distance_sensor_enable(ds7,TIME_STEP);
wb_distance_sensor_enable(ds8,TIME_STEP);
wb_distance_sensor_enable(ds9,TIME_STEP);
wb_distance_sensor_enable(ds10,TIME_STEP);

% main loop:
% perform simulation steps of TIME_STEP milliseconds
% and leave the loop when Webots signals the termination
%
while wb_robot_step(TIME_STEP) ~= -1
  distance1 = wb_distance_sensor_get_value(ds1);
  if distance1 < 128
    wb_motor_set_position(motor_left1,15);
    wb_motor_set_velocity(motor_left1,2);
    wb_motor_set_position(motor_right1,15);
    wb_motor_set_velocity(motor_right1,2);
  end
  distance2 = wb_distance_sensor_get_value(ds2);
  if distance2 < 128
    wb_motor_set_position(motor_left2,15);
    wb_motor_set_velocity(motor_left2,2);
    wb_motor_set_position(motor_right2,15);
    wb_motor_set_velocity(motor_right2,2);
  end
  % Process here sensor data, images, etc.

  % send actuator commands, e.g.:
  %  wb_motor_set_postion(motor, 10.0);

  % if your code plots some graphics, it needs to flushed like this:
  drawnow;

end

% cleanup code goes here: write data to files, etc.
