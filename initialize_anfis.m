function [ fis ] = initialize_anfis( training_set )
    % »нициализаци€ и обучение нового контроллера.
    %    Example:
    % y = evalfis(x, fis)
    
    %numMFs = 3;
    %mfType = 'gaussmf';
    %in_fis = genfis1(training_set, numMFs, mfType);
    s = size(training_set);
    fis = genfis2(training_set(1:s(1), 1:4), training_set(1:s(1), 5), 0.6);
    
    %epoch_n = 20;
    %dispOpt = zeros(1,4);
    %fis = anfis(training_set, in_fis, [100, 0.05, 0.01, 0.9, 1.1], [1, 1, 1, 1]);
    %fis = anfis(training_set, in_fis);
    
end

