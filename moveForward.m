function moveForward(brick, time, res)
    
    for i = 1:100
       brick.MoveMotor('AD', 20);
       pause(res);
       brick.StopMotor('AD');
       if(brick.ColorCode(2) == 3)
          brick.beep();
          pause(4);
       end
    end
end