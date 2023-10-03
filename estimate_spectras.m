function [Pavg, freq] = estimate_spectras(inp, window, Noverlap, Nest, Ts)

    % Todo: check if it is usefull to remove mean here
    inp = inp - mean(inp);

    [Ndata, Nsignals] = size(inp);

    % factor 2 so that the magnitude corresponds to a single sided spectrum
    % 2.3*sin(2*pi*f0*time) <=> sqrt(puu(f0)) = 2.3
    W = sum(window) / Nest / 2;

    Pavg = zeros(Nest, Nsignals);

    for i = 1:Nsignals

        Navg = 0;
        ind_start = 1;
        ind_end   = Nest;
        while ind_end <= Ndata
    
            ind = ind_start:ind_end;
    
            inp_act = inp(ind,i);
    
            % Todo: check if it is usefull to remove mean here
            inp_act = inp_act - mean(inp_act);
    
            inp_act = window .* inp_act;
    
            U = fft(inp_act) / (Nest * W);
            Pact = U .* conj(U);
    
            Pavg(:,i) = Pavg(:,i) + Pact;
            Navg = Navg + 1;
    
            ind_start = ind_start + Nest - Noverlap;
            ind_end   = ind_end   + Nest - Noverlap;
    
        end
    
        Pavg(:,i) = Pavg(:,i) / Navg;

    end

    df = 1/(Nest*Ts);
    freq = (0:df:1/Ts-df).';

end
