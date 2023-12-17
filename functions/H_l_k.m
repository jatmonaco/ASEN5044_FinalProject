% gives the h matrix for the lth landmark at the location ln
function H_l_k = H_l_k(ln, r, k,f, w_A,t_obs,RNC)
    RNA =  R_NA_k(k,w_A,t_obs);
    l = RNA * ln; % convert asteroid coordinates to inertial frame

    i = RNC(:,1); j = RNC(:,2); k = RNC(:,3);

    lr = (l-r); % column vector 
    lr_k = lr'*k; % dot product of (l-r) and k

    % let c1 be the same term for all a1 and a2
%     a1 = f*((lr_i/lr_k/lr_k)*k - (lr_i/lr_k/lr_k)*i); % old calculation of a1
%     a2 = f*((lr_j/lr_k/lr_k)*k - (lr_j/lr_k/lr_k)*j); % old calculation of a2

    a1 = (f/lr_k/lr_k)*((lr.*k) - (lr_k*i)); % column vector of dh1/dr
    a2 = (f/lr_k/lr_k)*((lr.*k) - (lr_k*j)); % column vector of dh2/dr

    H_l_k = [a1' 0 0 0; 
         a2' 0 0 0];
end