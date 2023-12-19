function F = state_CT_to_DT_approx(dt_obs,A)
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
    [n,~] = size(A);
    F = eye(n) + dt_obs * A;    
end