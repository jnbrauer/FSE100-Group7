function drive(brick, dist, wait)
    shift(brick, 1, -1);
    brick.MoveMotorAngleRel('B', 100, dist, 'Brake');
    if wait
        brick.WaitForMotor('B');
    end
end