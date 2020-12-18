function [l, home1, home2, phantom] = defPh
    l1 = 0.137;
    l2 = 0.105;
    l3 = 0.105;
    l4 = 0.095;
    l = [l1 l2 l3 l4];
    q1 = 0;
    q2 = 0;
    q3 = 0;
    q4 = 0;
    home1 = [90 30.7 74.3614 -15.0613]*pi/180;
    home2 = [90 30.7 74.3614 -15.0613]*pi/180;

    L(1) = Link([q1 l1  0    0      0   0],'modified');
    L(2) = Link([q2 0   0   -pi/2   0   -pi/2],'modified');
    L(3) = Link([q3 0   l2   0      0   0],'modified');
    L(4) = Link([q4 0   l3   0      0   0],'modified');

    phantom = SerialLink(L, 'name', 'Phantom');
    phantom.tool = [0 0 1 l4; 1 0 0 0; 0 1 0 0; 0 0 0 1];