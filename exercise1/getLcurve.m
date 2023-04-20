function val = getLcurve(t_list)
    val = [];
    
    for t = t_list(1:1:length(t_list)) 
       if t >= (7/8)
          c_val = [0.01-(t-7/8)*0.08; 0];
       elseif t >= (6/8)
          c_val = [0.01 ; -0.01+(t-6/8)*0.08];
       elseif t >= (4/8)
          c_val = [-0.01 + (t-4/8)*0.08 ; -0.01];
       elseif t >= (2/8)
          c_val = [-0.01 ; 0.01 - (t-2/8)*0.08];
       elseif t >= (1/8)
          c_val = [0.0 - (t-1/8)*0.08; 0.01];
       else
          c_val = [0.0 ; 0.0 + t*0.08];
       end
       val = [val, c_val];
    end
end