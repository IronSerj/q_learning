function [ extended_actions ] = extend_actions_set( actions, state, action )

    extended_actions = actions;
    extended_actions(length(extended_actions) + 1) = action * state(2) / abs(state(2));
end
