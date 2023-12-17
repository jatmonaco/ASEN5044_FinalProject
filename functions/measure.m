function [u, v] = measure(l, r, RNC, u0, v0, f, R_NA)
    % calculate pixel coordinate of SC
    
    % unit vectors of camera coordinate system
    ihat = RNC(:, 1);
    jhat = RNC(:, 2);
    khat = RNC(:, 3);

    % transformed coords based on asteriod rotation
    % the coords of the satellite are in the inertial frame, and do NOT
    % require transformation 
    l = R_NA * l;
    
    % if the asteriod occuludes the object, return with no observations
    if l'*khat > 0
        u = NaN;
        v = NaN;
        return
    end
    
    % calculating coordinates of observation 
    u = f * ((l-r)'*ihat)/((l-r)'*khat) + u0;
    v = f * ((l-r)'*jhat)/((l-r)'*khat) + v0;

    % making sure object is within FOV
    if u<0 || u>1024 || v<0 || v>1024 || (l-r)'*khat < 0
        u = NaN;
        v = NaN;
    end
end