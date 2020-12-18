% Definicion del robot
clear;
clc;

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

% Inicializacion de comunicacion con ROS
[pub1, data1, pub2, data2] = rosInit();

% Enviar a HOME
homePh(pub1, data1, home1);
homePh(pub2, data2, home2);

% Trayectorias

seq1(pub1, data1, l, phantom);

init = dirPh(phantom)
init = [0 0.2 0.04 -90 0 90];
final = [0 0.15 0.2 -90 0 90]';
traj(pub1, data1, init, final, l, phantom);
traj(pub2, data2, init, final, l, phantom);

% Calculo coordenadas TCP
[pose1, pose2] = dirPh(phantom);

% Calculo de inversa
pos = [0 0.25 0.2]';      % xyz
ori = [-90 0 90];             % rpy (grados)
q = invPh(pos, ori, l, phantom)