% Turn Testing
function turn(brick, amount)
    shift(brick, -1, 1);
    brick.MoveMotorAngleRel('B', 100, amount, 'Brake');
    brick.WaitForMotor('B');
end