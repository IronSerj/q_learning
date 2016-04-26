function [ ] = main( )
% Call it to start

    training_set = build_training_set( 30 );
    
    training_set_test( training_set, sample_time );
end

