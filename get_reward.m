function [ new_state, reward ] = get_reward( sys_tf, actions, sample_time )
    % state = [speed, phi]
    % x - ��������� �������
    % phi - ���� ������� ��������
    % reward - �������
    % actions - ������ �������������� ��� � ������� � ������ ����������
    %           �������
        % Example
    %  [ final_state, reward ] = get_reward( start_state, action )
    
    new_state = get_next_state( sys_tf, actions, sample_time );

    if abs(new_state(2)) > 1
        reward = -1;
    else
        reward = 0;
    end
end

