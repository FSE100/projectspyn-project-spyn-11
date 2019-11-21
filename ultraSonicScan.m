function [mA, mB, mC] = ultraSonicScan(brick, turntime, n)
%ULTRASONICSCAN Summary of this function goes here
%   Detailed explanation goes here
    turn(brick, turntime, -1);
    A = ultraSonicDistances(brick, 1, n);
    turn(brick, turntime, 1);
    B = ultraSonicDistances(brick, 1, n);
    turn(brick, turntime, 1);
    C = ultraSonicDistances(brick, 1, n);
    turn(brick, turntime, -1);
    
    while(ismember(255, A) || ismember(255, B) || ismember(255, C))
        turn(brick, turntime, -1);
        A = ultraSonicDistances(brick, 1, n);
        turn(brick, turntime, 1);
        B = ultraSonicDistances(brick, 1, n);
        turn(brick, turntime, 1);
        C = ultraSonicDistances(brick, 1, n);
        turn(brick, turntime, -1);
    end
    
    %Get mean and standard deviations of A, B, and C
    mA = mean(A);
    %sA = std(A);
    mB = mean(B);
    %sB = std(B);
    mC = mean(C);
    %sC = std(C);
end

