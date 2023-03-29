tr_vibration = zeros(0,115);

data = readmatrix('IDEA173finaltr_vibration');
x=1;


for i=1:length(data)
    tr_vibration(x) = data(i);
    x = x + 1;
end


section1_tr = zeros(1,1);
section2_tr = zeros(1,6);
section3_tr = zeros(1,2);
section4_tr = zeros(1,9);
section5_tr = zeros(1,1);
section6_tr = zeros(1,4);
section7_tr = zeros(1,3);
section8_tr = zeros(1,4);
section9_tr = zeros(1,1);
section10_tr = zeros(1,3);
section11_tr = zeros(1,4);
section12_tr = zeros(1,5);
section13_tr = zeros(1,10);
section14_tr = zeros(1,7);
section15_tr = zeros(1,10);
section16_tr = zeros(1,9);
section17_tr = zeros(1,16);
section18_tr = zeros(1,9);
section19_tr = zeros(1,8);
section20_tr = zeros(1,3);

sec2 = 0;
sec3 = 0;
sec4 = 0;
sec6 = 0;
sec7 = 0;
sec8 = 0;
sec10 = 0;
sec11 = 0;
sec12 = 0;
sec13 = 0;
sec14 = 0;
sec15 = 0;
sec16 = 0;
sec17 = 0;
sec18 = 0;
sec19 = 0;
sec20 = 0;

for i=1:length(tr_vibration)
    hit_tr = tr_vibration(i);
    if hit_tr>0 && hit_tr<3300
        section1_tr(1) = hit_tr;
    elseif hit_tr>3600 && hit_tr<9400
        sec2 = sec2+1;
        section2_tr(sec2) = hit_tr;
    elseif hit_tr>9400 && hit_tr<12000
        sec3=sec3+1;
        section3_tr(sec3) = hit_tr;
    elseif hit_tr>12000 && hit_tr<15800
        sec4=sec4+1;
        section4_tr(sec4) = hit_tr;
    elseif hit_tr>15800 && hit_tr<18000
        section5_tr(1) = hit_tr;
    elseif hit_tr>18000 && hit_tr<21900
        sec6=sec6+1;
        section6_tr(sec6) = hit_tr;
    elseif hit_tr>21900 && hit_tr<25000
        sec7=sec7+1;
        section7_tr(sec7) = hit_tr;
    elseif hit_tr>25000 && hit_tr<28600
        sec8=sec8+1;
        section8_tr(sec8) = hit_tr;
    elseif hit_tr>28600 && hit_tr<30000
        section9_tr(1) = hit_tr;
    elseif hit_tr>30000 && hit_tr<34800
        sec10=sec10+1;
        section10_tr(sec10) = hit_tr;
    elseif hit_tr>34800 && hit_tr<38000
        sec11=sec11+1;
        section11_tr(sec11) = hit_tr;
    elseif hit_tr>38000 && hit_tr<41000
        sec12=sec12+1;
        section12_tr(sec12) = hit_tr;
    elseif hit_tr>41000 && hit_tr<44400
        sec13=sec13+1;
        section13_tr(sec13) = hit_tr;
    elseif hit_tr>44400 && hit_tr<47600
        sec14=sec14+1;
        section14_tr(sec14) = hit_tr;
    elseif hit_tr>47600 && hit_tr<51100
        sec15=sec15+1;
        section15_tr(sec15) = hit_tr;
    elseif hit_tr>51100 && hit_tr<54000
        sec16=sec16+1;
        section16_tr(sec16) = hit_tr;
    elseif hit_tr>54000 && hit_tr<57500
        sec17=sec17+1;
        section17_tr(sec17) = hit_tr;
    elseif hit_tr>57500 && hit_tr<60400
        sec18=sec18+1;
        section18_tr(sec18) = hit_tr;
    elseif hit_tr>60400 && hit_tr<63800
        sec19=sec19+1;
        section19_tr(sec19) = hit_tr;
    else
        sec20=sec20+1;
        section20_tr(sec20) = hit_tr;
    end
end

save('finaltrainingdata.mat','tr_vibration','section1_tr','section2_tr','section3_tr','section4_tr','section5_tr','section6_tr','section7_tr','section8_tr','section9_tr','section10_tr','section11_tr','section12_tr','section13_tr','section14_tr','section15_tr','section16_tr','section17_tr','section18_tr','section19_tr','section20_tr');