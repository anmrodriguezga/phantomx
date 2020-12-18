function seq2(pub2, data2, l, phantom, ~)
    
    % Giro
    [~,init] = dirPh(phantom);
    final = [0.25 0 0.2 -90 90 90]';
    traj(pub2, data2, init, final, l, phantom);
    pause(1/3);
    
    % Apertura gripper
    data2(5).Data = [-0.016 -0.016];
    send(pub2(5), data2(5));
    
    % Bajada a recoger
    [~,init] = dirPh(phantom);
    final = [0.25 0 0.04 -90 90 90]';
    traj(pub2, data2, init, final, l, phantom);
    pause(1/3);
    
    % Cierre gripper
    data2(5).Data = [0 0];
    send(pub2(5), data2(5));
    pause(1/3);
    
    % Subida
    [~,init] = dirPh(phantom);
    final = [0.25 0 0.2 -90 90 90]';
    traj(pub2, data2, init, final, l, phantom);
    pause(1/3);
    
    % Giro
    [~,init] = dirPh(phantom);
    final = [0 -0.25 0.2 90 0 -90]';
    traj(pub2, data2, init, final, l, phantom);
    pause(1/3);
    
    % Bajada
    [~,init] = dirPh(phantom);
    final = [0 -0.25 0.1 90 0 -90]';
    traj(pub2, data2, init, final, l, phantom);
    pause(1/3);    
    
    % Apertura gripper
    data2(5).Data = [-0.016 -0.016];
    send(pub2(5), data2(5));
    
    % Vuelta a home
    [~,init] = dirPh(phantom);
    final = [0 -0.15 0.2 90 0 -90]';
    traj(pub2, data2, init, final, l, phantom);
    pause(1/3);
    
    % Cierre gripper
    data2(5).Data = [0 0];
    send(pub2(5), data2(5));
    pause(1/3);