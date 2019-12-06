function pickupWheelchair(brick) 
    shift(brick, 1);
    while brick.ColorCode(1) ~= 6
        brick.MoveMotor('B', 50);
    end
    drive(brick, -1000, 1);
    turn90(brick, 1);
    shift(brick, 1);
    while ~brick.TouchPressed(3) && ~brick.TouchPressed(4)
        brick.MoveMotor('B', 100);
    end
    drive(brick, 100, 0);
    pause(0.5);
    drive(brick, -3150, 1);
    turn90(brick, 1);
    drive(brick, -1500, 1);
    brick.MoveMotor('A', 100);
    pause(3);
    brick.StopMotor('A');
    turn90(brick, 1);
    shift(brick, 1);
    while ~brick.TouchPressed(3) && ~brick.TouchPressed(4)
        brick.MoveMotor('B', 100);
    end
    drive(brick, 100, 0);
    pause(0.5);
    drive(brick, -1500, 1);
    turn90(brick, -1);
    shift(brick, 1);
    while brick.ColorCode(1) ~= 3
        brick.MoveMotor('B', 100);
    end
    while brick.ColorCode(1) ~= 6
        brick.MoveMotor('B', 50);
    end
end