function R_NA = R_NA_k(k,w_A,t_obs)
    th = 2* pi * 1/w_A * t_obs(k);  % [deg]
    R_NA = [cos(th) -sin(th) 0; 
            sin(th) cos(th)  0; 
            0       0        1];
end