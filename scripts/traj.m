function traj(pub, data, init, final, l, phantom)
    x0 = init(1);
    y0 = init(2);
    z0 = init(3);
    r0 = init(4);
    p0 = init(5);
    ye0 = init(6);
    
    x1 = final(1);
    y1 = final(2);
    z1 = final(3);
    r1 = final(4);
    p1 = final(5);
    ye1 = final(6);
    
    points = 100;
    xvals = linspace(x0, x1, points);
    yvals = linspace(y0, y1, points);
    zvals = linspace(z0, z1, points);
    rvals = linspace(r0, r1, points);
    pvals = linspace(p0, p1, points);
    yevals = linspace(ye0, ye1, points);
    
    for i=1:size(xvals,2)
        pos = [xvals(i) yvals(i) zvals(i)]';
        ori = [rvals(i) pvals(i) yevals(i)];
        q = invPh(pos, ori, l, phantom);
        
        data(1).Data = q(1) * pi / 180;
        data(2).Data = q(2) * pi / 180;
        data(3).Data = q(3) * pi / 180;
        data(4).Data = q(4) * pi / 180;
        
        send(pub(1), data(1));
        send(pub(2), data(2));
        send(pub(3), data(3));
        send(pub(4), data(4));
        pause(1/30);
    end
        