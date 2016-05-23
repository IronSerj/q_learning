function [ fis, extended_training_set, extended_actions, new_state ] = q_learning( fis, sys_tf, training_set, actions, state, iteration, sample_time, epsilon, gamma )
    %   fis - нечеткая система
    %   training_set - обучающее множество
    %   extended_training_set - обучающее множество, расширенное новым
    %   примером
    FORCE_VALUES = -1:0.1:1;
    BASE_SET_SIZE = 50;
    %MAX_SET_SIZE = 800;
    
    tss = size(training_set);
    if rand() > epsilon && tss(1) > BASE_SET_SIZE
        [~, a] = get_preferable_action(fis, state, FORCE_VALUES);
    else
        a = rand()*2 - 1; % отображаем значение на промежуток [-1; 1]
        %a = rand();
    end
    
    extended_actions = extend_actions_set( actions, state, a );
    
    [new_state, reward] = get_reward(sys_tf, extended_actions, sample_time);
    base_reward = reward;
    if abs(new_state(2)) <= 0.5 && tss(1) > BASE_SET_SIZE % Если маятник не упал и размер обучающей выборки достаточен
        [next_reward, ~] = get_preferable_action(fis, new_state, FORCE_VALUES);
        reward = reward + gamma * next_reward;
    end

    extended_training_set = extend_training_set( training_set, state, a, reward, base_reward, new_state );
    
    if abs(new_state(2)) > 0.5 % Если маятник упал
        fprintf('%d actions, %d iteration;\n', length(extended_actions), iteration);
        fis = initialize_anfis(extended_training_set);
        %sample = extended_training_set(1:length(extended_training_set), 1:4);
        %extended_training_set = cat(2, sample, evalfis(sample, fis));
        if tss(1) > BASE_SET_SIZE
            %[ extended_training_set ] = recalculate_trainig_set(fis, extended_training_set, gamma, FORCE_VALUES);
        end
        [ ~, extended_actions, new_state ] = initialize_episode(sys_tf, sample_time );
    end
end
