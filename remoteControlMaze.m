function remoteControlMaze(brick)
    global key

    shift(brick, 1);

    while 1
        pause(0.1);
        switch key
            case 'w'
                % Move claw up
                brick.MoveMotor('A', 100);
                disp('W Pressed!');

            case 's'
                % Move claw down
                brick.MoveMotor('A', -100);
                disp('S Pressed!');

            case 'uparrow'
                % Drive forwards
                shift(brick, 1);
                if ~brick.TouchPressed(3) &&  ~brick.TouchPressed(4)
                    brick.MoveMotor('B', 100);
                else
                    brick.MoveMotor('B', 0);
                end
                disp('Up Arrow Pressed!');

            case 'downarrow'
                % Drive Backwards
                shift(brick, 1);
                brick.MoveMotor('B', -100);
                disp('Down Arrow Pressed!');

            case 'leftarrow'
                % Turn left
                shift(brick, -1);
                brick.MoveMotor('B', -100);
                disp('Left Arrow Pressed!');

            case 'rightarrow'
                % Turn right
                shift(brick, -1);
                brick.MoveMotor('B', 100);
                disp('Right Arrow Pressed!');

            case 0
                % Stop
                brick.MoveMotor('A', 0);
                brick.MoveMotor('B', 0);
                disp('No Key Pressed!');

            case 'q'
                % Quit
                drive(brick, 1000, 1);
                break;

        end
    end
end