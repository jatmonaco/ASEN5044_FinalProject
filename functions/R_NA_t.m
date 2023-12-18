function R_NA = R_NA_t(t)
    % load('sim_setup.mat', 'w_A')
    w_A = 4.296057 * 60 * 60;   % [sec] rotation period
    th = 2* pi * 1/w_A * t;  % [rad]
    R_NA = [cos(th) -sin(th) 0; 
            sin(th) cos(th)  0; 
            0       0        1];
end