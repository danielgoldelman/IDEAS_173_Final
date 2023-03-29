function [comment] = buildSingle(nth,loc,type,real_error)
    if real_error(nth) < -5
        comment = "Hit the " + loc + type + " note a bit later.\n";
    elseif real_error(nth) > 5
        comment = "Hit the " + loc + type + " note a bit sooner.\n";
    else
        comment = "";
    end
end