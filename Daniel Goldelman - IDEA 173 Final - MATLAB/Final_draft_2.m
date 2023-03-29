clear all;
close all;

% load training data

load("finaltrainingdata.mat");

%get all data

%[amplitude, Fs]=audioread('audioSample3_altDTMF_1234567890.wav');  % This reads in the .wav file

s1 = serial('/dev/cu.usbmodem14401');               %define serial port
s1.BaudRate=9600;                  %define baud rate
     
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
                        
pts2get = 2000;
time = zeros(283);
vib = zeros(283);

fprintf('Here we go!\n');

for i=1:pts2get
    onePt=fscanf(s1,'%u%u');
    
    time(i) = onePt(1);
    vib(i) = onePt(2);
end

fprintf("Great job!\n");

fclose(s1);

% plot vib*time

plot(time,vib)

avVib = movmean(vib, 10);

gethits = zeros(11);
x = 1;
i = 1;

fprintf("Begin while");

while i<2000
    if avVib(i) > 8
        gethits(x) = time(i);
        x = x + 1;
        i = i + 190;
    else
        i = i + 1;
    end
end

fprintf("Done w thresh");

percent_error = zeros(11);

fprintf("Begin PE");

for i=1:length(gethits)
    percent_error(i) = (abs(tr_vibration(i)-gethits(i))/tr_vibration(i))*100;
end

fprintf("Done w PE");

total_error = sum(percent_error,'all');

fprintf("Done w TE");

percent_error
total_error
    
