function [Cpi, Cd] = calculate_controllers(PID, Gf_p, Ts)

    Kp = PID(1);
    Ki = PID(2);
    Kd = PID(3);
    
    Cpi = ss( Kp*Gf_p + Ki*Ts*tf([1 0], [1 -1], Ts) );
    Cd  = ss( Kd/Ts*tf([1 -1], [1 0], Ts) );

end

