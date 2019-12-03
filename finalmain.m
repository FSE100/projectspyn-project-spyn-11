%{
ports:
ultrasonic: 1
color: 2
touch: 3
left:  A
right: D
%}


motorlf = -57;   %A
motorrf = -54.8; %D
motorlb = 20;
motorrb = 18.5;

threshold = 50;

brick.SetColorMode(2, 2);

while 1
    %Move Forward
    brick.MoveMotor('A', motorlf);
    brick.MoveMotor('D', motorrf);
    
    %Get Sensor Readings
    touch = brick.TouchPressed(3);
    color = brick.ColorCode(2);
    distance = brick.UltrasonicDist(1);
    
    %pickedUp Initialization
    pickedUp = 0;
    
    %Color Decisions
    if color == 5                      %if color is red stop for 4 sec                   
        disp('red');
        brick.StopMotor('AD');
        pause(4); %wait 4 seconds
        brick.MoveMotor('A', motorlf); 
        brick.MoveMotor('D', motorrf);
        pause(2);
    elseif color == 2 || color == 3    %if color is blue or green, activate keyboard control
        if color == 2
            if pickedUp == 0 % We only want to run kbrd controls if the robot hasn't picked up the passenger for case "blue"
                run('kbrdcontrol');
                pickedUp = 1;
            end
        end
        if color == 3
            if pickedUp == 1
                run('kbrdcontrol'); % We only want to run kbrd controls if the robot has picked up the passenger for case "green"
            end
        end
    end
    
    %Navigation
    if distance > threshold                %if right wall falls away from right side
        pause(0.3); %wait to get past wall
        brick.StopMotor('AD');
        brick.MoveMotor('A', -20);
        pause(4.2); %turning time
        brick.StopMotor('A');
        brick.MoveMotor('A', motorlf); 
        brick.MoveMotor('D', motorrf);
        pause(2);
    end 
    if touch %if hit wall in front
        pause(4); %keep going forward for a short period of time in order to calibrate
        
        disp('touched');
        brick.StopMotor('AD');          %stop
        dist = brick.UltrasonicDist(1); %get distance from right wall
        brick.MoveMotor('A', motorlb);
        brick.MoveMotor('D', motorrb);
        pause(3.5); %time to back up from wall
        brick.StopMotor('AD'); %stop
        
        if distance < threshold %if there is no wall on the right
            brick.MoveMotor('D', -18.5); 
            pause(3);
            brick.StopMotor('D');
            brick.MoveMotor('A', motorlf); 
            brick.MoveMotor('D', motorrf);
            pause(2);
        else %if there is a wall on the right
            brick.MoveMotor('A', -21);
            pause(3);
            brick.StopMotor('A');
            brick.MoveMotor('A', motorlf); 
            brick.MoveMotor('D', motorrf);
            pause(2);
        end
    end
end
