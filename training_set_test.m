function [ ] = training_set_test( training_set, sample_time, fis )
    
    if nargin < 3
        fis = initialize_anfis( training_set );
    end
    sys_tf = initialize_pendulum();
    
    [ ~, actions, state ] = initialize_episode( sys_tf, sample_time );
    for i = 0:200
        [~, action] = get_preferable_action( fis, state, -1:0.1:1);
        actions = extend_actions_set( actions, state, action );
        [ state, ~ ] = get_reward( sys_tf, actions, sample_time );
        if abs(state(1)) > 0.9
            break;
        end
    end
        
    actions(length(actions) + 1) = 0;
    t = 0:sample_time:((length(actions) - 1)*sample_time);

    lsim(sys_tf, actions, t)

end

