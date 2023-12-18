function y = y_measured(lp, x_nom, RNC, t,noise,check_vis)
    % calculate pixel coordinate of SC. Returns y = [u;v].
    %
    % INPUTS:
    %   - lp        Coordinates of the landmark in a asteroid-fixed,
    %               asteroid-centered frame. 
    %   - x_nom     The current state of the spacecraft
    %   - RNC       The ADCS info/instrument coordinate positions
    %   - t         Current time in seconds
    %   - noise     Boolean. if 'true', adds expected noise.
    %   - check_vis Boolean. if 'true', returns NaNs when the target is
    %               occluded or out of frame.
    %
    % OUTPUTS:
    %   - y         y = [u1;v1; ... u_n; v_n]
    % 
    % TODO:         Vectorize this better. Could make it so it takes many
    %               target inputs and gives many outputs. 
    
    % loading in simulation set-up paramters
    f = 2089.7959;              % [pixels]
    u_0 = 512;                  % [pixels]
    v_0 = 512;                  % [pixels]
    sig_u = 0.25;               % [pixels]
    sig_v = 0.25;               % [pixels]    

    % getting coordinates of SC
    r = x_nom(1:3);

    % unit vectors of camera coordinate system
    ihat = RNC(:, 1);
    jhat = RNC(:, 2);
    khat = RNC(:, 3);

    % transformed coords based on asteriod rotation
    % the coords of the satellite are in the inertial frame, and do NOT
    % require transformation 
    R_NA = R_NA_t(t);
    l = R_NA * lp;
    
    % calculating coordinates of observation 
    u = f * ((l-r)'*ihat)/((l-r)'*khat) + u_0;
    v = f * ((l-r)'*jhat)/((l-r)'*khat) + v_0;
    
    % adding noise 
    if noise==true
        u = u + normrnd(0,sig_u);
        v = v + normrnd(0,sig_v);
    end
    
    if check_vis == true
        % making sure object is within FOV
        if u<0 || u>1024 || v<0 || v>1024 || ((l-r)'*khat < 0)
            u = NaN;
            v = NaN;
        end
    
            % if the asteriod occuludes the object, return with no observations
        if l'*khat > 0
            u = NaN;
            v = NaN;
        end
    end
    y = [u; v];
end