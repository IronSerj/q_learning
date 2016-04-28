function [ extended_training_set ] = extend_training_set( training_set, state, action, reward, base_reward, new_state )

    extended_training_set = training_set;
    index = size(extended_training_set);
    index = index(1) + 1;
    extended_training_set(index, 1) = state(1);
    extended_training_set(index, 2) = abs(state(2));
    extended_training_set(index, 3) = state(3);
    extended_training_set(index, 4) = action;
    extended_training_set(index, 5) = reward;
    extended_training_set(index, 6) = base_reward;
    extended_training_set(index, 7) = new_state(1);
    extended_training_set(index, 8) = abs(new_state(2));
    extended_training_set(index, 9) = new_state(3);
end

