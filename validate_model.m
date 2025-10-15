function [] = validate_model(m0)
%VALIDATE_MODEL Validate the model in Lab 3 of the course TSRT92. 
% This function validates the model and provides appropriate feedback to students.
% The input m0 should be an idnlgrey object.
% 
% validate_model(m0)


z_test = iddata([3.5733 3.6155 3.6815 3.7412 3.7903; 6.5379 6.5176 6.4799 6.4436 6.4150]',10.6237*ones(5,1),0.01);
y = sim(m0,z_test);
diff = z_test.y - y.y;

if all(diff < 1e-3,'all')
    fprintf("Your model is likely accurate.\n")
elseif any(diff(1,:) > 1e-3)
    fprintf("It appears that the initial values of the states may be incorrect.\n")
else
    [~,state] = max(max(diff));
fprintf('Your model appears to have an issue, most likely related to the state equation for x_%i or x_%i,\n or incorrect initial values of the parameters.\n', state, state + 2)
end
end

