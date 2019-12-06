% Hannah Nilsson
% Alma Vasquez
% Jude Brauer
% Grace Wood-Miller
% Josh Burnham

global key
InitKeyboard();

brick.SetColorMode(1, 2);

shift(brick, 1);

hasChair = 0;

while 1
    if key == 'q'
        break;
    elseif brick.TouchPressed(3) ||  brick.TouchPressed(4)
        disp("Bump");
        drive(brick, 100, 0);
        pause(0.5);
        drive(brick, -1750, 1);
        turn90(brick, -1);
    elseif brick.ColorCode(1) == 3
        disp("Green");
        shift(brick, 1);
        while brick.ColorCode(1) ~= 6
            brick.MoveMotor('B', 50);
        end
        brick.StopMotor('B');

        disp("r for remote control pickup");
        pause(3.0);
        if key == 'r'
            disp("Remote control");
            remoteControlMaze(brick);
        else
            drive(brick, -1000, 1);
            turn90(brick, 1);
            shift(brick, 1);
            while ~brick.TouchPressed(3) && ~brick.TouchPressed(4)
                brick.MoveMotor('B', 100);
            end
            pause(1);
            drive(brick, -3100, 1);
            turn90(brick, 1);
            drive(brick, -1500, 1);
            brick.MoveMotor('A', 100);
            pause(3);
            brick.StopMotor('A');
            turn90(brick, 1);
            shift(brick, 1);
            while ~brick.TouchPressed(3) && ~brick.TouchPressed(4)
                brick.MoveMotor('B', 100);
            end
            pause(1);
            drive(brick, -1500, 1);
            turn90(brick, -1);
            shift(brick, 1);
        end
        
        while brick.ColorCode(1) ~= 3
                brick.MoveMotor('B', 100);
        end
        while brick.ColorCode(1) ~= 6
            brick.MoveMotor('B', 50);
        end
        
        hasChair = 1;
    elseif brick.ColorCode(1) == 4 && hasChair == 1
        disp("Yellow");
        drive(brick, 4000, 1);
        turn(brick, 2300);
        brick.MoveMotor('A', -100);
        pause(2);
        brick.StopMotor('A');
        drive(brick, 1500, 1);
        break;
    elseif brick.ColorCode(1) == 5
        disp("Red");
        brick.StopMotor('B');
        pause(2.0);
        %drive(brick, 1000, 1);
        shift(brick, 1);
        while brick.ColorCode(1) ~= 6
            brick.MoveMotor('B', 50);
        end
    elseif brick.UltrasonicDist(2) > 30
        disp("Turn right");
        drive(brick, 2000, 1);
        turn90(brick, 1);
        drive(brick, 4000, 1);
    elseif brick.UltrasonicDist(2) > 20
        disp("Too far");
        turn(brick, 150);
        drive(brick, 1000, 1);
        turn(brick, -150);
    elseif brick.UltrasonicDist(2) < 10
        disp("Too close");
        turn(brick, -300);
        drive(brick, 1000, 1);
        turn(brick, 250);
    elseif brick.UltrasonicDist(2) < 15
        disp("Too close");
        turn(brick, -150);
        drive(brick, 1000, 1);
        turn(brick, 125);
    else
        shift(brick, 1);
        brick.MoveMotor('B', 100);
    end
    
    pause(0.1);
end

brick.StopMotor('B');

CloseKeyboard();