function calibrate(brick)
    data = [0 brick.UltrasonicDist(1)];
    
    while(true)
        data(end - 1) = data(end);
        data(end) = brick.UltrasonicDist(1);

        if(data(end) < data(end - 1))
            turn(brick, 0.1, 1);
        elseif(data(end) > data(end - 1))
            turn(brick, 0.1, -1);
        end
    end
end