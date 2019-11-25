% Turn Testing
function turn90(brick, dir)
    shift(brick, -1);
    brick.StopMotor('B');
    brick.MoveMotorAngleRel('B', 100, 1150*dir, 'Brake');
    brick.WaitForMotor('B');
end