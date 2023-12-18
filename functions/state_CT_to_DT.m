function [F,G,Q] = state_CT_to_DT(dt_obs,A,B,Gamma,W)
    % This takes the state evolution matrices of a stoccastic continuous-time 
    % linear system and returns its equivalent descritized matrices, e.g.: 
    %       \dot{X}(t) = A*X + B*u + Gamma*\Tilde{w}(t)
    %               --> X[k+1] = F*X[k] + G*u + w[k]
    %  This function is only concern with the state evolution, and not any
    %  observations. If no noise in the system, then set gamma to a zero
    %  matrix. 
    %  
    %  *** It should be noted that this gives it at ONE timestep ***
    %
    % INPUTS: 
    %   - dt_obs    The timestep of descritation [scalar]
    %   - A         See the equation above. A [n x n] matrix, where n is
    %               the number of state variables. 
    %   - B         See eqn above. A [n x m] matrix, where m is the number
    %               of inputs. 
    %   - Gamma     See eqn above. [n x n] matrix.  
    %   - W         The process noise covariance matrix, where \Tilde{w}(t) \sim \mathcal{N}(0,W).
    %               [m x m] matrix. 
    %   - seed:     The random seed to generate the noise. If consistent
    %               nosie is not desired, set to a random number. 
    %
    % OUTPUTS:
    %   - F         See eqn above. [n x n] matrix. 
    %   - G         "           ". [n x m] matrix.
    %   - w_k       "           ". [n x 1] vector. 

    % finding number of state variables and inputs
    [n,m] = size(B);
    
    % converting to discrete time
    A_hat = zeros(n+m,n+m);
    A_hat(1:n,1:n) = A;
    A_hat(1:n,(n+1):end) = B;
    exmp_A_hat = expm(A_hat*dt_obs);
    G = exmp_A_hat(1:n,(n+1):end);

    % Simulating noise 
    Z = zeros(n*2,n*2);
    Z(1:n,1:n) = -A;
    Z((n+1):end,(n+1):end) = A';
    Z(1:n,(n+1):end) = Gamma * W * Gamma';
    expm_Z = expm(Z*dt_obs);
    F = expm_Z((n+1):end,(n+1):end)';
    Q = F * expm_Z(1:n,(n+1):end);
end