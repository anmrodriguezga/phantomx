function q_out = invPh(pos, ori, l, phantom)
    % Calculo de las variables articulares del PhantomX
    
    l1 = l(1);
    l2 = l(2);
    l3 = l(3);
    l4 = l(4);
    q4 = 0;
    
    W_tcp = [0 0 -l4 1]';       % Muñeca con respecto a TCP

    R = rpy2r(ori, 'deg');
    T_0_tcp = rt2tr(R, pos);     % MTH de 0 a TCP
    W_0 = T_0_tcp * W_tcp;      % Vector de 0 a muñeca
    q1 = atan2d(W_0(2), W_0(1));

    r = sqrt(W_0(1)^2 + W_0(2)^2);
    beta = atan2d(W_0(3) - l1, r);
    P_2w = sqrt(r^2 + (W_0(3) - l1)^2);

    cos_q3 = (P_2w^2 - l2^2 - l3^2)/(2 * l2 * l3);
    if abs(cos_q3) > 1
        cos_q3 = sign(cos_q3);
    end
    sen_q3 = sqrt(1 - (cos_q3)^2);
    q3 = atan2d(sen_q3, cos_q3);

    gamma = atan2d(l3 * sind(q3),l2 + l3 * cosd(q3));
    q2 = -(beta + gamma) + 90;

    R_0_3 = phantom.A([1 2 3],[q1*pi/180 q2*pi/180 q3*pi/180 q4]);
    Rf = R_0_3(1:3,1:3)' * R * phantom.tool(1:3,1:3)';
    q4 = -acosd(Rf(1,1));

    q_out = [q1 q2 q3 q4]';