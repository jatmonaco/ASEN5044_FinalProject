%% Simulation set-up parameters
% taken from the last page of "OrbitDetermination-fall2023.pdf" 

% physical paramters
mu_A = 4.892e-9;            % [km^3/s^2]
w_A = 4.296057 * 60 * 60;   % [sec] rotation period
r_S = [1.5e8,0,0]';         % [km]
Phi_0 = 1e14;               % [kg km/s^2]
rho = 0.4;                  % [--]
A_M = (1/62)*1e-6;          % [km^2/kg]
sig_m = 1e-9;               % [km/s^2]

% camera parameters
f = 2089.7959;              % [pixels]
u_0 = 512;                  % [pixels]
v_0 = 512;                  % [pixels]
u_min = 0;                  % [pixels]
v_min = 0;                  % [pixels]
u_max = 1024;               % [pixels]
v_max = 1024;               % [pixels]
sig_u = 0.25;               % [pixels]
sig_v = 0.25;               % [pixels]

% timing parameters
t_0 = 0;                    % [sec]
t_f = 432000.0;             % [sec]
dt_int = 60;                % [sec]
dt_obs = 600;               % [sec]
r_nom = [0,-1,0]';          % [km]
dr_nom = [0,0, sqrt(mu_A/norm(r_0_nom))]';    % [km/s]