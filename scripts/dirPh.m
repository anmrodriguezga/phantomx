function [pose1, pose2] = dirPh(phantom)
    
    % Posicion robot 1
    pose_sub1 = rossubscriber('/robot1/joint_states');
    actual_pose1 = receive(pose_sub1);
    disp(actual_pose1.Position);
    q_1 = actual_pose1.Position(1:4,1);
    disp(q_1);
    
    T1 = phantom.fkine(q_1');
    [R1,t1] = tr2rt(T1);
    rpy1 = tr2rpy(R1, 'deg');

    pose1 = [t1; rpy1'];
    
    % Posicion robot 2
    pose_sub2 = rossubscriber('/robot2/joint_states');
    actual_pose2 = receive(pose_sub2);
    disp(actual_pose2.Position);
    q_2 = actual_pose2.Position(1:4,1);
    
    T2 = phantom.fkine(q_2');
    [R2,t2] = tr2rt(T2);
    rpy2 = tr2rpy(R2, 'deg');

    pose2 = [t2; rpy2'];