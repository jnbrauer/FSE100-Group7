% Turn Testing
function turn(brick, amount)
    shift(brick, -1);
    brick.StopMotor('B');
    brick.MoveMotorAngleRel('B', 100, amount, 'Brake');
    brick.WaitForMotor('B');
end