function moveForward(brick, time, res, dir)
    % Right motor --> A
    % Left motor --> D
    % if time isn't evenly divisible by res, rounds down

    brick.MoveMotor('D', 20); 
    brick.MoveMotor('A', 19.4);
    for i = 1:floor(time/res)
       pause(res);
       %color = brick.ColorCode(2);
       %if(color == 5)
       %   brick.StopMotor('AD');
       %   disp("saw red");
          %pause(4); 
          %break;
      % end
    end
    brick.StopMotor('AD');
end