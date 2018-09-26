function J = luminance_change(I, target, value)

% Control if the brightness and contrast is increasing or decreasing.
% According to user input calculation will be made

    if target == 'c+'
        value = (1-(value/100));
        J = imadjust(I,[0 value],[]);
    elseif target == 'c-'
        value = (value/100);
        J = imadjust(I, [value 1], []);
    elseif target == 'b+'
        value = (value/100);
        J = imadjust(I, [], [value 1]);
    elseif target == 'b-'
        value = (1-(value/100));
        J = imadjust(I, [], [0 value]);
    end 
end