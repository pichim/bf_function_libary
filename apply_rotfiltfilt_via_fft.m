function xf = apply_rotfiltfilt_via_fft(G, sinarg, x, Ts)

    % signal size
    [Nx, nx] = size(x);
    xf = zeros(Nx, nx);
    p = exp(1j*(sinarg));

    df = 1 / (Nx * Ts);
    fnyq = 1 / (2 * Ts);
    freq = (0:df:2*fnyq-df).';
    g = squeeze(freqresp(G, 2*pi*freq));
    g = g .* conj(g);
    
    for i = 1:nx
        % eliminate mean
        y = x(:,i) - mean(x(:,i));
        yR = y .* p;
        yQ = y .* conj(p);
        % filtering in transformed coordinates
        yR = filtfilt_fft(g, yR);
        yQ = filtfilt_fft(g, yQ);
        % back transformation
        % xf(:,i) = real((yR.*conj(p) + yQ.*p)*0.5); % scaling does not
        % matter if we build the raio anyways
        xf(:,i) = real((yR.*conj(p) + yQ.*p));
    end

end

function y = filtfilt_fft(g, x)

    y = ifft( fft(x) .* g );

end

