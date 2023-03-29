tr_vibration = zeros(11);

data = readmatrix('IDEA173finaltr_vibration');
x=1;


for i=1:length(data)
    tr_vibration(x) = data(i);
    x = x + 1;
end

save('finaltrainingdata.mat','tr_vibration');