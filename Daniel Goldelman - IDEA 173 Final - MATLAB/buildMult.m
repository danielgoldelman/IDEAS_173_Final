function [comment] = buildMult(nth1,nth2,loc,type,real_error)
    if mean(real_error(nth1:nth2), "all") < -5
        comment = "Play the " + loc + type + " notes a bit slower.\n";
    elseif mean(real_error(nth1:nth2), "all") > 5
        comment = "Play the " + loc + type + " notes a bit faster.\n";
    else 
        comment = "";
    end
end