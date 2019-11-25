% 1: straight, -1: turning
function shift(brick, to)
    persistent shiftState;
    if isempty(shiftState)
        shiftState = to*-1;
    end
    
    if to ~= shiftState
        brick.StopMotor('B');
        brick.MoveMotor('C', -50*to);
        pause(0.3);
        brick.MoveMotor('C', -5*to);
    end
    
    shiftState = to;
end