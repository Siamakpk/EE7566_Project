% EE 7566 Homework 

% Vehicle and component characteristics:
initial_mass = 1000; % total mass of body without powertrain
rot_mass_coeff = 1.05; % Increase in mass due to acceleration of rotating masses
g = 9.8; % Gravitional acceleration m/s2
front_area = 2.57; % Front area of the car m2
Cd = 0.26; % Aerodynamic drag coefficient
Battery_eff = 0.95; %Efficiency of battery
Gear_diff_eff = 0.97; %Efficiency of gearbox and differential
EV_eff = 0.92; %efficiency of EM and inverter
air_density = 1.25; % Density of air kg/m3
fr = 0.006; % Friction coefficient of tires

% Assumptions:
alpha = 0; % road grade
Vwind = 0; %wind speed
% Part 1:
effective_mass = initial_mass * rot_mass_coeff; % Effective mass without powertrain

max_speed = 150; % Max speed of the vehicle Km/h
Vcar = max_speed * 1e+3 / 3600; %car speed m/s
wheel_radius = 0.3; % wheel radius m
wheel_C = pi * 2 * wheel_radius; % wheel circumfrence m 
max_wheel_rot = (max_speed *1e+3) / (wheel_C*60); % wheel rot speed at max speed RPM
max_wheel_rot = max_wheel_rot * (pi/30); % wheel rot speed at max speed rad/sec
 
Gear_ratio =  9.0478; % Gear ratio (electric motor to wheels)

max_EM_rot = max_wheel_rot * Gear_ratio; % Electric machine maximum rot speed rad/sec

% Calculation of resistive forces:

F_rolling = fr * effective_mass * g * cos (alpha); % rolling resistance Nm
F_wind = 0.5 * air_density * front_area * Cd * ( Vcar + Vwind)^2; % Aerodynamic resistance Nm
F_grading = effective_mass * g * sin (alpha); % Grading resistance Nm
F_acceleration_cap = effective_mass * 0.05 * g;
F_resistive_tot = F_rolling + F_wind + F_grading + F_acceleration_cap; %total resistance at max speed Nm

% Calculation of power:
P_car = F_resistive_tot * Vcar; % Power on wheels
P_battery = P_car / (Battery_eff * Gear_diff_eff * EV_eff) % Power of battery

% End of Part 1,2


