import java.util.ArrayList;

turnTime = 1.5

%turn(brick, turnTime, 1)

moveForward(brick, 0, 0.2)


%dir = getDirection(brick, turnTime, 35)

%for i = 0:dir
%    turn(brick, turnTime, 1)
%end

function dir = getDirection(brick, turnTime, threshold)
    import java.util.ArrayList;

    A = ArrayList;
    B = ArrayList;
    
    for i = 1:4
        A.add(brick.UltrasonicDist(1)); % Get distance from in left of robot's original position
        turn(brick, turnTime, 1);
        disp("a")
    end
    
    A
    
    for i=0:3
        if(A.get(i) > threshold) % Filtering values
            B.add(i);
        end
    end
    
    random = randi([0 B.size()-1]);
    dir = B.get(random); 
    % The array list named B holds the indices of the directions that the robot is able to go in (0 = front, 1 = right, 2 = back, 3 = left)
end

function turn(brick, parameter, direction) % for direction, 1 = right, -1 = left, 2 = back
    brick.MoveMotor('A', direction*20);
    brick.MoveMotor('D', direction*-20);
    pause(parameter);
    brick.StopMotor('AD');
    pause(2);
    %brick.MoveMotorAngleRel('A', 20, -170, 'Coast');
    %brick.MoveMotorAngleRel('D', 20, 170, 'Coast');
    
    
end