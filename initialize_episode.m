function [ training_set, actions, new_state ] = initialize_episode( sys_tf, sample_time )
%start state of pendulum

    actions = [0.1];
    [state, reward] = get_reward(sys_tf, actions, sample_time);
    training_set = [0, 0, 0.1, reward, reward, state(1), abs(state(1))];
    actions(2) = 0;
    
    [new_state, reward] = get_reward(sys_tf, actions, sample_time);
    training_set = extend_training_set( training_set, state, 0, reward, reward, new_state );
end