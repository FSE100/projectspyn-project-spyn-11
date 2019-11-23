global key
InitKeyboard();
brick.SetColorMode(1, 2);
while 1
    pause(0.1);
    color = brick.ColorCode(2);
    disp(color);
    distance = brick.UltrasonicDist(1);
    disp(distance);
    
    switch key
        case 'uparrow'
            disp('Up');
            brick.MoveMotor('AD', 50);
           
        case 'downarrow'
            disp('Down');
            brick.MoveMotor('A', -20);
            brick.MoveMotor('D', -19);
            
        case 'leftarrow'
            disp('Left');
            brick.MoveMotor('A', -50);
            brick.MoveMotor('D', 50);
            
        case 'rightarrow'
            disp('Right');
            brick.MoveMotor('A', 50);
            brick.MoveMotor('D', -50);
        case 0
            disp('No Key Press');
            brick.StopMotor('AD', 'Coast');
        case 'w'
            disp('Crane Up');
            brick.MoveMotorAngleRel('C', 10, -30, 'Brake');
            
        case 's'
            disp('Crane Down');
            brick.MoveMotorAngleRel('C', 10, 30, 'Brake');
            
        case 'q'
            break;
    end
end
CloseKeyboard();