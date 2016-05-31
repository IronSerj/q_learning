function [ training_set ] = recalculate_trainig_set( fis, training_set, gamma, force_values )
    s = size(training_set);
    for index = 1:s(1)
       [reward, ~] = get_preferable_action(fis, [training_set(index, 6), training_set(index, 7)], force_values);
       training_set(index, 4) = training_set(index, 5) + gamma * reward;
    end
end