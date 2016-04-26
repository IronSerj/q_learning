function [ training_set ] = build_training_set( iterations_count, training_set )
    %
    % training_set = [platform speed, abs phi, speed, a, reward]
    %
    SAMPLE_TIME = 0.1;
    EPSILON = 0.1;
    GAMMA = 0.9;
    
    sys_tf = initialize_pendulum();
    
    if nargin > 1
        [~, actions, state] = initialize_episode(sys_tf, SAMPLE_TIME);
        fis = initialize_anfis(training_set);
    else
        [training_set, actions, state] = initialize_episode(sys_tf, SAMPLE_TIME);
        fis = 0;
    end

    for i = 1:iterations_count
        %fis = initialize_anfis(training_set);
        %fprintf('%d actions, %d iteration;\n', length(actions), i);
        [fis, training_set, actions, state] = q_learning(fis, sys_tf, training_set, actions, state, i, SAMPLE_TIME, EPSILON, GAMMA);
    end

end

