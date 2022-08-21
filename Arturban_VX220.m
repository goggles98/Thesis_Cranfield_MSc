%% ---------- code for combining the artemis urban and VX220 test 019 data
% The VX220_testData.mat contains velocity vs time curve for the VX220
% being tested on Campus. The data was 79 seconds long, hence that data has
% been repeated thrice to make the dataset in VX220_testData.mat. 

% this dataset is then combined with the artemis urban drive cycle and is
% ready to be used in the simulink model

%% The algorithm

% first load the VX220 data
load 'VX220_testData.mat'

% extract values from artemis drive cycle
vel_ArtUrban = out.velocity.signals.values;
time_ArtUrban = out.velocity.time;

% combine artemis and VX220
time_DriveCycle = [time_ArtUrban ; 993+time];
vel_DriveCycle = [vel_ArtUrban ; vel];

% set negative values of velocity, if any to 0
vel_DriveCycle(vel_DriveCycle < 0) = 0;

%%
% clear out unnecessary values
clear ans
clear time
clear time_ArtUrban
clear vel
clear vel_ArtUrban

% run vehicle parameters file
vehParam

% plot the drive cycle
plot(time_DriveCycle, vel_DriveCycle)
ylabel('Speed (m/s)')
xlabel('Time (s)')
