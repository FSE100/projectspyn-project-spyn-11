function [average, standdev] = ultraSonicDistances(brick, port, n)
%ULTRASONICSCAN Summary of this function goes here
%   Detailed explanation goes here

    distance = zeros(1, n);    
    pause(0.5)
    
    for i = 1:n
        distance(i) = brick.UltrasonicDist(port);
    end
    
    average = mean(distance);
    standdev = std(distance);
end