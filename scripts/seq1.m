function seq1(pub1, data1, l, phantom)
    
    % Giro
    init = dirPh(phantom);
    final = [0.25 0 0.2 -90 90 90]';
    traj(pub1, data1, init, final, l, phantom);
    pause(1/3);
    
    % Apertura gripper
    data1(5).Data = [-0.016 -0.016];
    send(pub1(5), data1(5));
    
    % Bajada a recoger
    init = dirPh(phantom);
    final = [0.25 0 0.04 -90 90 90]';
    traj(pub1, data1, init, final, l, phantom);
    pause(1/3);
    
    % Cierre gripper
    data1(5).Data = [0 0];
    send(pub1(5), data1(5));
    pause(1/3);
    
    % Subida
    init = dirPh(phantom);
    final = [0.25 0 0.2 -90 90 90]';
    traj(pub1, data1, init, final, l, phantom);
    pause(1/3);
    
    % Giro
    init = dirPh(phantom);
    final = [0 0.2 0.2 -90 0 90]';
    traj(pub1, data1, init, final, l, phantom);
    pause(1/3);
    
    % Bajada
    init = dirPh(phantom);
    final = [0 0.2 0.04 -90 0 90]';
    traj(pub1, data1, init, final, l, phantom);
    pause(1/3);   
    
    % Acercamiento
    init = dirPh(phantom);
    final = [0 0.25 0.04 -90 0 90]';
    traj(pub1, data1, init, final, l, phantom);
    pause(1/3);   
    
    % Apertura gripper
    data1(5).Data = [-0.016 -0.016];
    send(pub1(5), data1(5));
    
    % Alejamiento
    init = dirPh(phantom);
    final = [0 0.2 0.04 -90 0 90]';
    traj(pub1, data1, init, final, l, phantom);
    pause(1/3); 
    
    % Cierre gripper
    data1(5).Data = [0 0];
    send(pub1(5), data1(5));
    pause(1/3);
    
    % Vuelta a home
    init = dirPh(phantom);
    final = [0 0.15 0.2 -90 0 90]';
    traj(pub1, data1, init, final, l, phantom);
    pause(1/3);