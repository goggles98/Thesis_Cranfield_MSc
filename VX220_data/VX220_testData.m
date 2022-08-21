load 'Test_019-out.mat'

% downsample the variables by 300 since every second has 300 subvalues
time = downsample(s.Time, 300);
vel = downsample(s.VelForward, 300);
figure(1)
plot(time, vel)
ylabel('Speed (m/s)')
xlabel('Time (s)')

%% Artemis Urban cycle has 993 duration. Make the duration more
% we will make the cycle duration to be 1230 (artemis urban + VX220*3

time = (1:3*length(time))';
vel = [vel ; vel ; vel];

% make velocithy (end) = 0
time = [time ; 238]
vel = [vel ; 0]
figure(2)
plot(time, vel)

clear s