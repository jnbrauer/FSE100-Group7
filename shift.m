% 1: straight, -1: turning
function shift(brick, to, from)
    if to ~= from
        brick.MoveMotor('C', -50*to);
        pause(0.3);
        brick.MoveMotor('C', -5*to);
    end
end