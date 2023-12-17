function x_noms = x_nom(x_nom_0,t)
    r0 = norm(x_nom_0(1:3));
    w0 = x_nom_0(6) / r0;
    x_noms = [0;
            -r0 * cos(w0*t);
            r0 * sin(w0*t);
            0;
            w0*r0*sin(w0*t);
            w0*r0*cos(w0*t)];
end