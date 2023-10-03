function fcut = get_fcut_from_exp(dynLpfMin, dynLpfMax, expo, throttle)

    expof = expo / 10.0;
    curve = throttle .* (1 - throttle) * expof + throttle;
    fcut = (dynLpfMax - dynLpfMin) * curve + dynLpfMin;

end

