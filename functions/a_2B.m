function f = a_2B(r,mu_A)
    % calculating gravitational forces
    f = -mu_A / norm(r)^3 * r;
end 