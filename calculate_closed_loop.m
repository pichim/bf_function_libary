function CL = calculate_closed_loop(Co, Ci, P, Gf, Gd)
% T + S ~= 1 (does not hold here)
% Co = Cpi, Ci = 1  , Gd = Cd * d/dt * Gf_d_part -> 2dof PID cntrl betaflight
% Co = Kv , Ci = Cpi, Gd =      d/dt * Gf_d_part -> P-PI cntrl

    C  = Ci*(Gd + Co)*Gf; % C, (Cd + Cpi)*Gf
    L  =             P*C; % L
    S  =       1/(1 + L); % S
    
    % T   = Co*Ci*P*Gf*S; % T  : w  -> y
    T   =    Co*Ci*P*S; % T  : w  -> y_bar
    % SP  =       P*Gf*S; % SP : d  -> y     (from input disturbance)
    SP  =          P*S; % SP : d  -> y_bar (from input disturbance)
    SC  =          C*S; % SC : n  -> u (from noise)
    SCw =      Co*Ci*S;
    
    Li = Ci*P*Gf*Gd; % inner loop
    Si = 1/(1 + Li);
    Pi = Ci*P*Gf*Si; % inner closed loop, seen from the outer cntrl
    Ti =      Li*Si; % inner closed loop to outbut dy/dt
    
    Lo = Co*Ci*P*Gf/(1 + Ci*P*Gf*Gd); % outer loop
    
    CL.C   = C;
    CL.L   = L;
    CL.S   = S;
    CL.SCw = SCw;
    
    CL.T  = T;
    CL.SP = SP;
    CL.SC = SC;
    
    CL.Li = Li;
    CL.Pi = Pi;
    CL.Ti = Ti;
    CL.Si = Si;
    
    CL.Lo = Lo;

end

