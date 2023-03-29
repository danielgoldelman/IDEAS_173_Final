function [comment, prob, per_error] = build1(measure, pts, tr)
    if isempty(pts)
        prob = "You missed a note in measure " + measure + "!\n";
        comment = "Null\n";
        per_error = 0;
    elseif length(pts) > 1
        prob = "You added a note in measure " + measure + "!\n";
        comment = "Null\n";
        per_error = 0;
    else 
        prob = "";
        for i=1:length(pts)
            real_error(i) = ((tr(i)-pts(i))/tr(i))*100;
        end

        if real_error(1) < -5
            comment = "Hit the whole note a bit later.";
        elseif real_error(1) > 5
            comment = "Hit the whole note a bit sooner.";
        else
            comment = "";
        end
        
        per_error = 0;
        for i=1:length(real_error)
            per_error = per_error + abs(real_error(i));
        end
    end
end