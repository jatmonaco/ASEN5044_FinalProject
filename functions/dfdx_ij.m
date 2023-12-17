function dfdx_ij = dfdx_ij(r, i , j, mu_A)
    if i==j
        dfdx_ij  = mu_A * (3*r(i)^2/(norm(r)^5) - 1/(norm(r)^3));
    else
        dfdx_ij = 3*mu_A*r(i)*r(j)/(norm(r)^5);
    end
end