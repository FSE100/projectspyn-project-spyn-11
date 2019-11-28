global key
InitKeyboard();
while 1
    pause(0.1);
    
    switch key
        case 'uparrow'
            %disp('Up');
            brick.MoveMotor('A', 57);
            brick.MoveMotor('D', 54.8);
           
        case 'downarrow'
            %disp('Down');
            brick.MoveMotor('A', -20);
            brick.MoveMotor('D', -19);
            
        case 'leftarrow'
            brick.MoveMotor('A', 50);
            brick.MoveMotor('D', -50);
            
        case 'rightarrow'
            brick.MoveMotor('A', -50);
            brick.MoveMotor('D', 50);
            
        case 0
            %disp('No Key Press');
            brick.StopMotor('AD', 'Coast');
            
        case 'w'
            %disp('Crane Up');
            brick.MoveMotorAngleRel('C', 10, -30, 'Brake');
            
        case 's'
            %disp('Crane Down');
            brick.MoveMotorAngleRel('C', 10, 30, 'Brake');
            
        case 'q'
            break;
    end
end

CloseKeyboard();