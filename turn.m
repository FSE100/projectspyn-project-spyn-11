function turn(brick, time, direction) % for direction, 1 = right, -1 = left
    brick.MoveMotor('A', direction*-20);
    brick.MoveMotor('D', direction*19.4);
    pause(time);
    brick.StopMotor('AD', 'Brake');
    
    %calibrate(brick);
end