H_1_1 = H_l_k(pos_lmks_A(:,1),x_0(1:3),1,f,w_A, t_obs,RNC); 
m = 2; % 2 meausrement dimensions
y_1 = H_1_1*dx_DT(1,:)'; 
dy_DT = nan(num_lmks,steps,m); % at landmark l and step k, dy is a row vector
% for each one, calculate H matrix and plot
ylabels = ["$\Delta u$ [pixels]", "$\Delta v$ [pixels]"]
l1vis = zeros(1,steps);
uv = nan(steps,2);
for li = 1  %start by just doing this for the 1st landmark
    figure;
    fig = tiledlayout(2,1)
    l = pos_lmks_A(:,li);
    for ki = 1:steps
        RNC = R_CtoN(:,:,ki); % get the RNC matrix for that time step
        R_NA = R_NA_k(ki,w_A,t_obs); % get the RNA matrix for that time step
        r = x_nom_vec(ki,1:3)';
%         r = x_ode45(ki, 1:3)';
        % check to see if landmark is in field of view
%         l_vis = l_visible(l,r,RNC,0,0,f,R_NA);
        [u, v] = measure(l,r,RNC,u_0,v_0,f,R_NA);
        meas = [u,v];
        uv(ki,:) = [u,v];
        if anynan(meas) == 0 % if object is in field of view
            H_ll_kk = H_l_k(l,r,ki,f,w_A,t_obs,RNC);
            dy_l_k = H_ll_kk*dx_DT(ki,:)'; % get dy for that location
            dy_DT(li,ki,:) = (dy_l_k)'; % save it
            l1vis(ki) = 1; % this is just for landmark 1
        end  % if l_vis is 1, save, if not, stay nan
    end
    for i = 1:2
        nexttile(fig),hold on, grid on
        plot(t_ode45/60/60,dy_DT(li,:,i),'.')
        xlim([t_obs(1)/60/60, 72])
        ylabel(ylabels(i),Interpreter='latex')
    end
end 

figure; 
    l1vis_orig = ones(1,length(u_obs(1,:)))-isnan(u_obs(1,:))
    plot(t_ode45/60/60,l1vis), hold on
    plot(t_ode45/60/60,l1vis_orig,'--')
    xlim([t_obs(1)/60/60, 72])
    ylabel("Landmark 1 Visible (binary)")
    xlabel("Time, t [hours]")

% figure;
% fig = tiledlayout(n,1);
% ylabels = ["$\Delta x$ [km]", "$\Delta y$ [km]","$\Delta z$ [km/s]","$\Delta \dot x$ [km/s]", "$\Delta \dot y$ [km/s]","$\Delta \dot z$ [km/s]"];
% for i = 1:n
%     nexttile(fig)
%     hold on
%     plot(t_ode45/60/60,dx_DT(:,i))
%     xlim([t_obs(1)/60/60, 72])
%     ylabel(ylabels(i),Interpreter='latex')
% end