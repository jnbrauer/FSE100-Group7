function drive(brick, dist, wait)
    shift(brick, 1, -1);
    brick.ResetMotorAngle('B');
    brick.MoveMotorAngleRel('B', 100, dist, 'Brake');
    if wait
        while abs(dist - brick.GetMotorAngle('B')) > abs(dist/5)
            if brick.ColorCode(1) == 5
                brick.StopMotor('B');
                pause(3.0);
                brick.MoveMotorAngleRel('B', 100, 1000, 'Brake');
                brick.WaitForMotor('B');
                brick.MoveMotorAngleRel('B', 100, dist - brick.GetMotorAngle('B'), 'Brake');
            end
            pause(0.1);
        end
        disp("Finished driving");
        brick.StopMotor('B');
    end
end