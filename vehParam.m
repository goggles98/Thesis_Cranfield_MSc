%% This file contains the vehicle parameters for the Westfield Chassis ...
%  parameters considered - mass, Cd, Area, air density, g, rollint coeff
%  file used as information for simulink model name - 
%  simulink model calculates power required to overcome resistance forces
%  output of model - Wh/km number for a particular drive cycle selected

%% define the parameters

mass = 650;
Cd = 0.6;
A = 1.6;
rho = 1.2;
g = 9.8;
f = 0.012;  % rolling resistance coefficient

% run the file and store it in the workspace before running the simulink
% model