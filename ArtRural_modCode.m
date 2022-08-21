%% ---------------- Code Description ---------------------------------
%  This code should be run after running ArtRural_mod.slx
%  ArtRural_mod runs Daniel's drive cycle generation model and stores
%  velocity values. The velocity signals is downspampled by 2 and so is the
%  time signal (velocity is a structure with time series so time comes with
%  it). Time is then modified to contain values only between 0 and 0.5*(max
%  value). 

%  The end result is that the velocity vs time curve is compressed by a
%  factor of 2 on the time scale, however since the velocity is sampled
%  twice, we still have more or less the same velocity values

%% The algorithm for the first modification - only time scale compression by 2

% Take velocity and time and plot them
velocity = out.velocity.signals.values; 
time = out.velocity.time;
figure(1)
plot(time(1:end), velocity*3.6)
xlabel('TIme (s)')
ylabel('Velocity kmph')
title('Artemis Rural Drive Cycle')

% Sample the velocity and time signal, and make new time signal. Plot
% results
velocity_sampled = downsample(velocity,2);
time_sampled = downsample(time,2);
time = 1:length(time_sampled);
figure(2)
plot(time, velocity_sampled)
xlabel('TIme (s)')
ylabel('Velocity (mps)')
title('Modified Artemis Drive Cycle - v1')
velocity = velocity_sampled';

%% Modification 2 - inlcude two instances of 0 26.8 in 5 seconds
% deceleration also by nearly the same rate

velocity(54:80) = 0;
velocity(55:59) = linspace(0, 26.8, 5); % accelerate
velocity(60) = velocity(59);            % hold
velocity(61:67) = linspace(26.8, 0, 7); % decelerate
velocity(69:73) = linspace(0, 26.8, 5); % accelerate
velocity(74:80) = linspace(26.8, 0, 7); % decelerate

figure(3)
plot(time, velocity*3.6)
xlabel('TIme (s)')
ylabel('Velocity (kmph)')
title('Modified Artemis Drive Cycle - v2')


%% Run vehParam.m file to get parameters into workspace and clear variables
vehParam

clear time_sampled
clear velocity_sampled

%% end of code - run ArtRural_energyCalc.slx
