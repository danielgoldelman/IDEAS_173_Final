
%% Whole note header

function [comment, prob] = sec1fun(pts,tr)
    if isempty(pts)
        prob = "You missed a note in measure 1!\n";
        comment = "Null\n";
    elseif length(pts) > 1
        prob = "You added a note in measure 1!\n";
        comment = "Null\n";
    else 
        prob = "";
    end

    for i=1:length(pts)
        real_error(i) = ((tr(i)-pts(i))/tr(i))*100;
    end
    
%% Whole 
if real_error(1) < -5
    comment = "Hit the whole note a bit later.";
elseif real_error(1) > 5
    comment = "Hit the whole note a bit sooner.";
else
    comment = "";
end




%% Normal header

function [comment, prob] = sec2fun(pts,tr)
    if length(pts) > 6
        prob = "You played an extra note in measure 2!\n";
        comment = "Null\n";
    elseif length(pts) < 6
        prob = "You missed a note in measure 2!\n";
        comment = "Null\n";
    else 
        prob = "";
    end

    for i=1:length(pts)
        real_error(i) = ((tr(i)-pts(i))/tr(i))*100;
    end
    
    per_error = 0;
    for i=1:length(real_error)
        per_error = per_error + abs(real_error(i));
    end
        
    per_error = per_error/6;


%% Half

if real_error(1) < -5
    comment = "Hit the first half note a bit later.\n";
elseif real_error(1) > 5
    comment = "Hit the first half note a bit sooner.\n";
else 
    comment = "";
end

%% Quarter

if real_error(1) < -5
    comment = "Hit the first quarter note a bit later.\n";
elseif real_error(1) > 5
    comment = "Hit the first quarter note a bit sooner.\n";
else
    comment = "";
end

%% Multiples

if mean(real_error(3:6), "all") < -5
    comment = comment + "Play the second set of sixteenth notes a bit slower.\n";
elseif mean(real_error(3:6), "all") > 5
    comment = comment + "Play the second set of sixteenth notes a bit faster.\n";
else 
    comment = comment + "";
end