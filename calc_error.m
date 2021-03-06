function [ error ] = calc_error( training_set )
    fis = initialize_anfis(training_set);
    sample = training_set(1:length(training_set), 1:3);
    
    result = evalfis(sample, fis);
    error = cat(2, training_set(1:length(training_set), 4), result)
end

