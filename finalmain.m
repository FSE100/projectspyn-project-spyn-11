motorlf = -57; %A
motorrf = -54.8; %D
motorlb = 20;
motorrb = 18.5;

brick.SetColorMode(2, 2);

while 1
    brick.MoveMotor('A', motorlf); 
    brick.MoveMotor('D', motorrf);
    touch = brick.TouchPressed(3);
    color = brick.ColorCode(2);
    disp(color);
    if color == 5 
        disp('red');
        brick.StopMotor('AD');
        pause(4);
        brick.MoveMotor('A', motorlf); 
        brick.MoveMotor('D', motorrf);
        pause(6);
    elseif color == 2 || color == 3 
       run('kbrdcontrol');
    end
    dist = brick.UltrasonicDist(1);
    if dist > 50
        pause(0.3);
        brick.StopMotor('AD');
        brick.MoveMotor('A', -21);
        pause(3);
        brick.StopMotor('A');
        brick.MoveMotor('A', motorlf); 
        brick.MoveMotor('D', motorrf);
        pause(2);
    end
    if touch
        disp('touched');
        brick.StopMotor('AD');
        dist = brick.UltrasonicDist(1);
        brick.MoveMotor('A', motorlb); 
        brick.MoveMotor('D', motorrb);
        pause(4);
        brick.StopMotor('AD');
        if dist<50
            brick.MoveMotor('D', -18.5);
            pause(3);
            brick.StopMotor('D');
            brick.MoveMotor('A', motorlf); 
            brick.MoveMotor('D', motorrf);
            pause(2);
        else
            brick.MoveMotor('A', -21);
            pause(3);
            brick.StopMotor('A');
            brick.MoveMotor('A', motorlf); 
            brick.MoveMotor('D', motorrf);
            pause(2);
        end
    end
end