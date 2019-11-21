%j = 0;
%color = brick.ColorCode(2)
%while color ~= 2, 3 , 5
%    color = brick.ColorCode(2)
%    while(j < getDirection(brick, 0.5, 55, 35))
%        turn(brick, 1, 55, 1);
%        moveForward(brick, 2.0, 1)
%    end
%end
%moveForward(brick, 1.0, 0.25)

calibrate(brick);

%brick.GyroAngle(3)

%pause(1)

%turn(brick, 0.5, 50, -1);

%calibrations = zeros(100,1);

%data = zeros(100,2);

%startangle = brick.GyroAngle(3)

%while(isnan(startangle))
%    brick.GyroCalibrate(3)
%    startangle = brick.GyroAngle(3)
%end

%for i = 1 : 100
 %   data(i,1) = brick.GyroRate(3);
    %data(i,2) = brick.GyroAngle(3);
%end

%data