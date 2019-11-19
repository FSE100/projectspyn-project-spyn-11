function distance = ultraSonicScan(brick, port, n)
%ULTRASONICSCAN Summary of this function goes here
%   Detailed explanation goes here
    distance = 0;
    
    pause(0.5)
    
    for i = 1:n
        distance = distance + brick.UltrasonicDist(port);
    end
    
    distance = distance/n;
end