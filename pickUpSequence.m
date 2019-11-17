function pickUpSequence(brick)
    brick.MoveMotor('C', 10); % move arm down
    pause(1); % adjust time as needed
    brick.StopMotor('C');
    pause(5); % time to adjust robot for pickup
    brick.MoveMotor('AD', 20); % move robot forward
    pause(1.5); % time to pick up person
    brick.StopMotor('AD');
    brick.MoveMotor('C', -10); % move arm up
    pause(1);
    brick.StopMotor('C');
    % initiate navigation sequence from here
end