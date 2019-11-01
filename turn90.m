% Turn Testing
function turn90(brick, dir)
    shift(brick, -1, 1);
    brick.MoveMotorAngleRel('B', 100, 1200*dir, 'Brake');
    brick.WaitForMotor('B');
end