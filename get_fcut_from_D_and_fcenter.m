function fcut = get_fcut_from_D_and_fcenter(D, fcent)

    Q = 1/2./D;
    fcut = fcent/2./Q.*(-1 + sqrt(1 + 4*Q.^2));

end

