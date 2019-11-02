% Turn Testing
function turn90(brick, dir)
    shift(brick, -1, 1);
    brick.MoveMotorAngleRel('B', 100, 1150*dir, 'Brake');
    brick.WaitForMotor('B');
end