function dfdx = dfdx(r_nom,mu_A)
    dfdx =[ 0                          0                          0                            1   0   0;
            0                          0                          0                            0   1   0;
            0                          0                          0                            0   0   1;
            dfdx_ij(r_nom, 1, 1, mu_A) dfdx_ij(r_nom, 1, 2, mu_A) dfdx_ij(r_nom, 1, 3, mu_A)   0   0   0;
            dfdx_ij(r_nom, 2, 1, mu_A) dfdx_ij(r_nom, 2, 2, mu_A) dfdx_ij(r_nom, 2, 3, mu_A)   0   0   0;
            dfdx_ij(r_nom, 3, 1, mu_A) dfdx_ij(r_nom, 3, 2, mu_A) dfdx_ij(r_nom, 3, 3, mu_A)   0   0   0];
end 