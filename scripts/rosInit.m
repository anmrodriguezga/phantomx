function [pub1, data1, pub2, data2] = rosInit()

    %Iniciar nodo ROS
    rosinit;
    disp('Conexion iniciada.');
    % Creación publicadores robot 1
    joint11 = rospublisher('/robot1/joint1_position_controller/command',...
        'std_msgs/Float64');
    joint12 = rospublisher('/robot1/joint2_position_controller/command',...
        'std_msgs/Float64');
    joint13 = rospublisher('/robot1/joint3_position_controller/command',...
        'std_msgs/Float64');
    joint14 = rospublisher('/robot1/joint4_position_controller/command',...
        'std_msgs/Float64');
    gripper1 = rospublisher('/robot1/gripper_position_controller/command',...
        'std_msgs/Float64MultiArray');
    
    pub1 = [joint11 joint12 joint13 joint14 gripper1]';
    
    % Creación publicadores robot 2
    joint21 = rospublisher('/robot2/joint1_position_controller/command',...
        'std_msgs/Float64');
    joint22 = rospublisher('/robot2/joint2_position_controller/command',...
        'std_msgs/Float64');
    joint23 = rospublisher('/robot2/joint3_position_controller/command',...
        'std_msgs/Float64');
    joint24 = rospublisher('/robot2/joint4_position_controller/command',...
        'std_msgs/Float64');
    gripper2 = rospublisher('/robot2/gripper_position_controller/command',...
        'std_msgs/Float64MultiArray');
    
    pub2 = [joint21 joint22 joint23 joint24 gripper2]';
    
    % Mensajes robot 1
    pose11 = rosmessage(joint11);
    pose12 = rosmessage(joint12);
    pose13 = rosmessage(joint13);
    pose14 = rosmessage(joint14);
    poseGrip1 = rosmessage(gripper1);
    
    data1 = [pose11 pose12 pose13 pose14 poseGrip1]';
    
    % Mensajes robot 2
    pose21 = rosmessage(joint21);
    pose22 = rosmessage(joint22);
    pose23 = rosmessage(joint23);
    pose24 = rosmessage(joint24);
    poseGrip2 = rosmessage(gripper2);
    
    data2 = [pose21 pose22 pose23 pose24 poseGrip2]';

