function [ result ] = get_next_state( sys_tf, actions, sample_time )
    actions(length(actions) + 1) = 0;
    t = 0:sample_time:((length(actions) - 1)*sample_time);
    
    interaction_result = lsim(sys_tf, actions, t);
    state = interaction_result(length(interaction_result) - 1, [1, 2]);
    next_state = interaction_result(length(interaction_result), [1, 2]);
    
    result(1) = next_state(1) - state(1);
    if next_state(2) == 0
        result(1) = (result(1) * state(2) / abs(state(2))) * -1;
    else
        result(1) = result(1) * next_state(2) / abs(next_state(2));
    end
    
    result(2) = next_state(2);
    
    %result(3) = dist(state(2), next_state(2));

    if next_state(2) * state(2) <= 0 % если маятник перевалился на другую сторону
        result(3) = (abs(next_state(2)) + abs(state(2))) * -1;
    else
        result(3) = abs(state(2)) - abs(next_state(2)); % (-) если маятник падает, (+) если идет вверх
    end
end

