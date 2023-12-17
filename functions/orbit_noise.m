function dx = orbit_noise(~,x_in,a_SRP,mu_A,W,seed)
    % calculating pertibation forces
    r = x_in(1:3);
    rng(seed)
    noise = mvnrnd(zeros([1,3]),W)';
    f = a_SRP + a_2B(r,mu_A) + noise;
    
    % building the derivative vector
    dx = zeros(size(x_in));
    dx(1:3) = x_in(4:6);
    dx(4:6) = f;
end