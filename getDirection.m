function x = getDirection(brick, turnTime, speed, threshold)
    import java.util.ArrayList;
    A = ArrayList;
    B = ArrayList;
    threshold = 35;
    
    for i = 1:4
        A.add(brick.UltrasonicDist(1)); % Get distance from in left of robot's original position
        turn(brick, turnTime, speed, 1);
    end
    
    disp(A)
    
    for i =0:3
        if(A.get(i) > threshold) % Filtering values
            B.add(i);
        end
        pause(0.5)
    end
    
    random = randi([0 B.size()-1]);
    x = B.get(random);
    disp(B) 
    % The array list named B holds the indices of the directions that the robot is able to go in (0 = front, 1 = right, 2 = back, 3 = left)
end
