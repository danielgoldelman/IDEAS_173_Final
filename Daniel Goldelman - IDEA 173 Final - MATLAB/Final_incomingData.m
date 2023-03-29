clear all;
close all;

% load training data
load("finaltrainingdata.mat");

%get all data

%[amplitude, Fs]=audioread('audioSample3_altDTMF_1234567890.wav');  % This reads in the .wav file

s1 = serial('/dev/cu.usbmodem14401');               %define serial port
s1.BaudRate=57600;                  %define baud rate
     
try
    fopen(s1);                  %open serial port
catch
    allPorts=instrfind;
    if isempty(allPorts)==0
        fclose(allPorts);
    end
    fopen(s1);
end

for i=1:50              % You can kind of ignore these lines for now
    onePt=fscanf(s1);   % They are just used to flush the junk characters
end                     % out of the serial port that the Arduino prints
                        % when it first starts up.
                        
pts2get = 45000;
time = zeros(1,pts2get);
vib = zeros(1,pts2get);

fprintf('Here we go!\n');

for i=1:pts2get
    onePt=fscanf(s1,'%u%u');
    
    time(i) = onePt(1);
    vib(i) = onePt(2);
end

fprintf("Great job!\n");

fclose(s1);


x = 1;
i = 1;
capturefreq = mean(diff(time(1:45000)))^-1;

sec2 = 0;
sec3 = 0;
sec4 = 0;
sec6 = 0;
sec7 = 0;
sec8 = 0;
s10 = 0;
s11 = 0;
s12 = 0;
s13 = 0;
s14 = 0;
s15 = 0;
s16 = 0;
s17 = 0;
s18 = 0;
s19 = 0;
s20 = 0;


while i<pts2get
    if vib(i) > 15
        hit = time(i);
        i = i + round(capturefreq*170);
        if hit>0 && hit<3600
            section1_pts(1) = hit;
        elseif hit>3600 && hit<9400
            sec2 = sec2 + 1;
            section2_pts(sec2) = hit;
        elseif hit>9400 && hit<12000
            sec3 = sec3 + 1;
            section3_pts(sec3) = hit;
        elseif hit>12000 && hit<15800
            sec4 = sec4+1;
            section4_pts(sec4) = hit;
        elseif hit>15800 && hit<18000
            section5_pts(1) = hit;
        elseif hit>18000 && hit<21900
            sec6 = sec6 + 1;
            section6_pts(sec6) = hit;
        elseif hit>21900 && hit<25000
            sec7 = sec7 + 1;
            section7_pts(sec7) = hit;
        elseif hit>25000 && hit<28600
            sec8 = sec8 + 1;
            section8_pts(sec8) = hit;
        elseif hit>28600 && hit<30000
            section9_pts(1) = hit;
        elseif hit>30000 && hit<34800
            s10 = s10 + 1;
            section10_pts(s10) = hit;
        elseif hit>34800 && hit<38000
            s11 = s11 + 1;
            section11_pts(s11) = hit;
        elseif hit>38000 && hit<41000
            s12 = s12 + 1;
            section12_pts(s12) = hit;
        elseif hit>41000 && hit<44400
            s13 = s13 + 1;
            section13_pts(s13) = hit;
        elseif hit>44400 && hit<47600
            s14 = s14 + 1;
            section14_pts(s14) = hit;
        elseif hit>47600 && hit<51100
            s15 = s15 + 1;
            section15_pts(s15) = hit;
        elseif hit>51100 && hit<54000
            s16 = s16 + 1;
            section16_pts(s16) = hit;
        elseif hit>54000 && hit<57500
            s17 = s17 + 1;
            section17_pts(s17) = hit;
        elseif hit>57500 && hit<60400
            s18 = s18 + 1;
            section18_pts(s18) = hit;
        elseif hit>60400 && hit<63800
            s19 = s19 + 1;
            section19_pts(s19) = hit;
        else
            s20 = s20 + 1;
            section20_pts(s20) = hit;
        end
    else
        i = i + 1;
    end
end

[a1,b1,c1] = sec1fun(section1_pts, section1_tr);
fprintf("Measure 1:\n\n");
if a1 == ""
    a1 = "Good!";
end
fprintf(a1 + b1 + "\n\n");

[a2,b2,c2] = sec2fun(section2_pts, section2_tr);
fprintf("Measure 2:\n\n");
if a2 == ""
    a2 = "Good!";
end
fprintf(a2 + b2 + "\n\n");

[a3,b3,c3] = sec3fun(section3_pts, section3_tr);
fprintf("Measure 3:\n\n");
if a3 == ""
    a3 = "Good!";
end
fprintf(a3 + b3 + "\n\n");

[a4,b4,c4] = sec4fun(section4_pts, section4_tr);
fprintf("Measure 4:\n\n");
if a4 == ""
    a4 = "Good!";
end
fprintf(a4 + b4 + "\n\n");

fprintf("Error for line 1: " + string(c1+c2+c3+c4) + ".\n\n");

[a5,b5,c5] = sec5fun(section5_pts, section5_tr);
fprintf("Measure 5:\n\n");
if a5 == ""
    a5 = "Good!";
end
fprintf(a5 + b5 + "\n\n");

[a6,b6,c6] = sec6fun(section6_pts, section6_tr);
fprintf("Measure 6:\n\n");
if a6 == ""
    a6 = "Good!";
end
fprintf(a6 + b6 + "\n\n");

[a7,b7,c7] = sec7fun(section7_pts, section7_tr);
fprintf("Measure 7:\n\n");
if a7 == ""
    a7 = "Good!";
end
fprintf(a7 + b7 + "\n\n");

[a8,b8,c8] = sec8fun(section8_pts, section8_tr);
fprintf("Measure 8:\n\n");
if a8 == ""
    a8 = "Good!";
end
fprintf(a8 + b8 + "\n\n");

fprintf("Error for line 2: " + string(c5+c6+c7+c8) + ".\n\n");

[a9,b9,c9] = sec9fun(section9_pts, section9_tr);
fprintf("Measure 9:\n\n");
if a9 == ""
    a9 = "Good!";
end
fprintf(a9 + b9 + "\n\n");

[a10,b10,c10] = sec10fun(section10_pts, section10_tr);
fprintf("Measure 10:\n\n");
if a10 == ""
    a10 = "Good!";
end
fprintf(a10 + b10 + "\n\n");

[a11,b11,c11] = sec11fun(section11_pts, section11_tr);
fprintf("Measure 11:\n\n");
if a11 == ""
    a11 = "Good!";
end
fprintf(a11 + b11 + "\n\n");

[a12,b12,c12] = sec12fun(section12_pts, section12_tr);
fprintf("Measure 12:\n\n");
if a12 == ""
    a12 = "Good!";
end
fprintf(a12 + b12 + "\n\n");

fprintf("Error for line 3: " + string(c9+c10+c11+c12) + ".\n\n");

[a13,b13,c13] = sec13fun(section13_pts, section13_tr);
fprintf("Measure 13:\n\n");
if a13 == ""
    a13 = "Good!";
end
fprintf(a13 + b13 + "\n\n");

[a14,b14,c14] = sec14fun(section14_pts, section14_tr);
fprintf("Measure 14:\n\n");
if a14 == ""
    a14 = "Good!";
end
fprintf(a14 + b14 + "\n\n");

[a15,b15,c15] = sec15fun(section15_pts, section15_tr);
fprintf("Measure 15:\n\n");
if a15 == ""
    a15 = "Good!";
end
fprintf(a15 + b15 + "\n\n");

[a16,b16,c16] = sec16fun(section16_pts, section16_tr);
fprintf("Measure 16:\n\n");
if a16 == ""
    a16 = "Good!";
end
fprintf(a16 + b16 + "\n\n");

fprintf("Error for line 4: " + string(c13+c14+c15+c16) + ".\n\n");

[a17,b17,c17] = sec17fun(section17_pts, section17_tr);
fprintf("Measure 17:\n\n");
if a17 == ""
    a17 = "Good!";
end
fprintf(a17 + b17 + "\n\n");

[a18,b18,c18] = sec18fun(section18_pts, section18_tr);
fprintf("Measure 18:\n\n");
if a18 == ""
    a18 = "Good!";
end
fprintf(a18 + b18 + "\n\n");

[a19,b19,c19] = sec19fun(section19_pts, section19_tr);
fprintf("Measure 19:\n\n");
if a19 == ""
    a19 = "Good!";
end
fprintf(a19 + b19 + "\n\n");

[a20,b20,c20] = sec20fun(section20_pts, section20_tr);
fprintf("Measure 20:\n\n");
if a20 == ""
    a20 = "Good!";
end
fprintf(a20 + b20 + "\n\n");

fprintf("Error for line 5: " + string(c17+c18+c19+c20) + ".\n\n");

per_error = (c1+c2+c3+c4+c5+c6+c7+c8+c9+c10+c11+c12+c13+c14+c15+c16+c17+c18+c19+c20)/10;

fprintf("Average percent error for this run: " + string(per_error)+"\n");

load('prev_error.mat');

fprintf("Average of previous error: " + string(prev_error) + "\n");

prev_error = (prev_error + per_error)/2;

save('prev_error.mat','prev_error');
    
