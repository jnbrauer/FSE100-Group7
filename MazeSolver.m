% Hannah Nilsson
% Alma Vasquez
% Jude Brauer
% Grace Wood-Miller
% Josh Burnham

brick.SetColorMode(1, 2);

shift(brick, 1, -1);
shiftState = 1;

while 1
    if brick.TouchPressed(3) ||  brick.TouchPressed(4)
        brick.StopAllMotors();
        drive(brick, 100, 0);
        pause(0.5);
        drive(brick, -1500, 1);
        turn90(brick, -1);
    elseif brick.UltrasonicDist(2) > 30
        brick.StopAllMotors();
        drive(brick, 1500, 1);
        turn90(brick, 1);
        drive(brick, 4000, 1);
    elseif brick.UltrasonicDist(2) > 20
        turn(brick, 150);
        drive(brick, 1000, 1);
    elseif brick.UltrasonicDist(2) < 10
        turn(brick, -150);
        drive(brick, 1000, 1);
    else
        shift(brick, 1, -1);
        brick.MoveMotor('B', 100);
    end
    
    pause(0.1);
    disp(brick.UltrasonicDist(2));
end