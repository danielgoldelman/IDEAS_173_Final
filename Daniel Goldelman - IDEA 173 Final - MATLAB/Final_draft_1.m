clear all;
close all;

% load training data

%get all data

%[amplitude, Fs]=audioread('audioSample3_altDTMF_1234567890.wav');  % This reads in the .wav file

s1 = serial('/dev/cu.usbmodem14401');               %define serial port
s1.BaudRate=115200;                  %define baud rate
     
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
                        
pts2get = 20000;
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
figure
subplot(2,2,1)
plot(time,vib)

subplot(2,2,2)
plot(vib)

gethits = zeros(11);
x=1;
hold = 0;
i = 1;

while i<20000
    if vib(i)>3
        gethits(x)=time(i);
        hold = time(i);
        x = x + 1;
        i = i + 50;
    else
        i = i + 1;
    end
end
