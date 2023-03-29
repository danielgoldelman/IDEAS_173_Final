function [comment,prob,per_error] = buildHead(measure,len,pts)
    if length(pts) > len
        prob = "You played an extra note in measure " + measure + "!\n";
        comment = "Null\n";
        per_error = 0;
    else
        prob = "You missed a note in measure " + measure + "!\n";
        comment = "Null\n";
        per_error = 0;
    end
end