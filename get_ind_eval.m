function ind_eval = get_ind_eval(sinarg, data, threshold)

    if nargin == 2
        threshold = 500;
    end
    
    Ndata = size(sinarg, 1);
    
    ind_eval_candidate = sinarg > 0;
    
    signal = zeros(Ndata, 1);
    signal(ind_eval_candidate) = 1;
    dsignal = [0; diff(signal)];
    
    ind_eval_start = find(dsignal >  0.9);
    ind_eval_end   = find(dsignal < -0.9) - 1;
    Neval = size(ind_eval_start, 1);
    
    ind_eval = false(Ndata, 1);
    for i = 1:Neval
        ind_verify = ind_eval_start(i):ind_eval_end(i);
        if var(data(ind_verify)) > threshold
            ind_eval(ind_verify) = true;
        end
    end

end