function [ reward, force ] = get_preferable_action( fis, state, forces_array )
    % Returns force, choosen by selected fis based on reward

    %speed = ones(length(forces_array), 1) * state(1);
    phi = ones(length(forces_array), 1) * state(1);
    dir = ones(length(forces_array), 1) * state(2);
    sample = cat(2, phi, dir);
    %sample = cat(2, sample, dir);
    sample = cat(2, sample, forces_array.');
    %sample = cat(2, phi, forces_array.');
    
    arr = evalfis(sample, fis);
    [reward, i] = max(arr);
    force = forces_array(i);
end

