% Works without process nosie
use_process_noise = false;
use_meas_noise = true;                         % Set true to include measurement noise in truth measurements
use_vanLoans_Q = true;                         % Set true to use the Q noise matrix calculated by Van Loan's method. 
                                                % Set false to use the static Q_kf matrix defined above.
rand_truth_pert = false;                        % set true to use a different LKF initial pertibation for each simulation. DO NOT SET TO TRUE                  
trust_scale = 1e0;                              % LKF initial uncertainty scaling factor (Adjusting P_0 for the filter)
process_noise_scale = 1e3;                      % LKF process noise matrix scaling factor (Adjusting Q for the filter)
meas_noise_scale = 2e1;                         % LKF measurement matrix scaling factor (Adjusting R for the filter)
x_pert = [ones(3,1)*1e-5; ones(3,1)*1e-7];               % Random initial uncertainty gerated from uncertainty matrix

% Kinda works with process nosie
num_sims = 15;                                  % number of simulations to do
use_process_noise = true;
use_meas_noise = true;                         % Set true to include measurement noise in truth measurements
use_vanLoans_Q = true;                         % Set true to use the Q noise matrix calculated by Van Loan's method. 
                                                % Set false to use the static Q_kf matrix defined above.
rand_truth_pert = false;                        % set true to use a different LKF initial pertibation for each simulation. DO NOT SET TO TRUE                  
trust_scale = 1e0;                              % LKF initial uncertainty scaling factor (Adjusting P_0 for the filter)
process_noise_scale = 1e6;                      % LKF process noise matrix scaling factor (Adjusting Q for the filter)
meas_noise_scale = 2e1;                         % LKF measurement matrix scaling factor (Adjusting R for the filter)
x_pert = [ones(3,1)*1e-5; ones(3,1)*1e-7];               % Random initial uncertainty gerated from uncertainty matrix