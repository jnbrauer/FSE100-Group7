% Hannah Nilsson
% Alma Vasquez
% Jude Brauer
% Grace Wood-Miller
% Josh Burnham

global key
InitKeyboard();

brick.SetColorMode(1, 2);

shift(brick, 1);

while 1
    if key == 'q'
        break;
    elseif brick.TouchPressed(3) ||  brick.TouchPressed(4)
        drive(brick, 100, 0);
        pause(0.5);
        drive(brick, -1500, 1);
        turn90(brick, -1);
    elseif brick.ColorCode(1) == 3
        %remoteControlMaze(brick);
        pickupWheelchair();
    elseif brick.ColorCode(1) == 4
        drive(brick, 4000, 1);
        turn(brick, 2300);
        brick.MoveMotor('A', -100);
        pause(2);
        brick.StopMotor('A');
        drive(brick, 1500, 1);
        break;
    elseif brick.ColorCode(1) == 5
        brick.StopMotor('B');
        pause(2.0);
        %drive(brick, 1000, 1);
        shift(brick, 1);
        while brick.ColorCode(1) ~= 6
            brick.MoveMotor('B', 50);
        end
    elseif brick.UltrasonicDist(2) > 30
        drive(brick, 2000, 1);
        turn90(brick, 1);
        drive(brick, 4000, 1);
    elseif brick.UltrasonicDist(2) > 20
        turn(brick, 150);
        drive(brick, 1000, 1);
        turn(brick, -150);
    elseif brick.UltrasonicDist(2) < 10
        turn(brick, -150);
        drive(brick, 1000, 1);
        turn(brick, 150);
    else
        shift(brick, 1);
        brick.MoveMotor('B', 100);
    end
    
    pause(0.1);
end
CloseKeyboard();