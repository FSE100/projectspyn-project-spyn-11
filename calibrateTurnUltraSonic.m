function calibrateTurnUltraSonic(brick)
    [mA, mB, mC] = ultraSonicScan(brick, 0.1, 100);
    
    while((mA >= mB && mB >= mC) || (mA <= mB && mB <= mC))
        disp([mA, mB, mC])
        if(mA >= mB && mB >= mC)
            turn(brick, 0.2, 1);
            [mA, mB, mC] = ultraSonicScan(brick, 0.1, 100);
        elseif(mA <= mB && mB <= mC)
            turn(brick, 0.2, -1);
            [mA, mB, mC] = ultraSonicScan(brick, 0.1, 100);
        end
    end
end