function y = y_measured(lp, x_nom, RNC, t,noise,check_vis)
    % calculate pixel coordinate of SC
    
    % loading in simulation set-up paramters
    load('sim_setup.mat','u_0', 'v_0', 'f','sig_u','sig_v')
    
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
        u = u + normrnd(0,sig_u^2);
        v = v + normrnd(0,sig_v^2);
    end
    
    if check_vis == true
        % making sure object is within FOV
        if u<0 || u>1024 || v<0 || v>1024 || (l-r)'*khat < 0
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