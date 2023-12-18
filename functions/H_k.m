function H = H_k(lp,x_nom,t,RNC)
    % load('sim_setup.mat', 'f')
    f = 2089.7959;              % [pixels]

    r = x_nom(1:3);     % position vector of SC
    R_NA = R_NA_t(t);   % rotation matrix for landmark 
    l = R_NA * lp;      % Convert landmark to asteriod inertial frame coords

    % unit vectors of camera coordinate system
    ihat = RNC(:, 1);
    jhat = RNC(:, 2);
    khat = RNC(:, 3);
    
    % forming measurement observation matrix
    lr = (l-r); % column vector 
    lr_i = lr'*ihat; 
    lr_j = lr'*jhat; 
    lr_k = lr'*khat; % dot product of (l-r) and k

    a1 = (f/lr_k/lr_k)*(khat*lr_i - ihat); % this is correct but we need to be able to show work
    a2 = (f/lr_k/lr_k)*(khat*lr_j - jhat);
    H = [a1' 0 0 0; 
         a2' 0 0 0];
end