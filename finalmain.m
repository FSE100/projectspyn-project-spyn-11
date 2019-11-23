%global key

motorleft = -21;
motorright = -19;
brick.SetColorMode(2, 2);
while 1
    brick.MoveMotor('A', -66); 
    brick.MoveMotor('D', -57);
    touch = brick.TouchPressed(3);
    color = brick.ColorCode(2);
    
    if color == 5 || color == 2 || color == 3 
        disp('red');
        brick.StopMotor('AD');
        pause(4);
        brick.MoveMotor('A', -66); 
        brick.MoveMotor('D', -57);
        pause(6);
    %elseif color == 2 || color == 3 
    %blue pick up customer
    %green drop off customer
        %{
        InitKeyboard();
        while 1
            switch key
                case 'uparrow'
                    disp('Up');
                    brick.MoveMotor('AD', 50);

                case 'downarrow'
                    disp('Down');
                    brick.MoveMotor('AD', -50);

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
        %}
    end
    dist = brick.UltrasonicDist(1);
    if dist>50
        pause(0.5);
        brick.StopMotor('AD');
        brick.MoveMotor('A', 1.1*motorleft);
        pause(3);
        brick.StopMotor('A');
    end
    if touch
        disp('touched');
        brick.StopMotor('AD');
        dist = brick.UltrasonicDist(1);
        brick.MoveMotor('A', -1*motorleft); 
        brick.MoveMotor('D', -1*motorright);
        pause(4);
        brick.StopMotor('AD');
        if dist<50
            brick.MoveMotor('D', motorright);
            pause(3);
            brick.StopMotor('D');
        else
            brick.MoveMotor('A', motorleft);
            pause(3);
            brick.StopMotor('A');
        end
    end
end