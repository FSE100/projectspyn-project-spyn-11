function dropOffSequence(brick)
    brick.MoveMotor('C', 10); % move arm down
    pause(1); % adjust time as needed
    brick.StopMotor('C');
    brick.MoveMotor('AD', -20); % move robot backward
    pause(2);
    brick.StopMotor('AD'); 
    % program ends after this function
    
    leftdist = 0;
    rightdist = 0;
    
    while(true)
        
end