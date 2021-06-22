%-------------------------------------------------------------------------%
% Author          : Urvi Mishra  
% Date            : 1-June-2018                                          %
%-------------------------------------------------------------------------%


gNam=120;
m0=0.06;h0=0.6;
Vr=-68;
e=exp(1);
ENa=54.2;
for Vm=(-50:10:60)
    v=Vm-Vr;
    am=(0.1)*(25-v)/(e^((25-v)/10)-1);
    bm=4*e^(-v/18);
    ah=0.07*e^(-v/20);
    bh=1/(e^((30-v)/10)+1);
    tm=1/(am+bm);
    th=1/(ah+bh);
    minf=am/(am+bm);
    hinf=ah/(ah+bh);
    for t= (0:0.02:5)
        t=[0:0.02:5];
        m=minf-(minf-m0)*e.^(-t/tm);
        h=hinf-(hinf-h0)*e.^(-t/th);
        gNa=gNam*(m.^3).*h;
        iNa=gNa*(Vm-ENa);
        figure(5)
        subplot(2,2,1)
        plot(t,gNa);
        xlim([0 5])
        title('gNa conductance model')
        xlabel('Time(ms)')
        ylabel('gNa')
        hold on
        subplot(2,2,2)
        plot(t,iNa)
        xlim([0 5])
        xlabel('Time(ms)')
        ylabel('iNa')
        title('iNa vs t')
        hold on
        pause(0.001)
        subplot(2,2,3)
        plot(t,m)
        xlim([0 5])
        xlabel('Time(ms)')
        ylabel('m')
        title('m vs t')
        hold on
        pause(0.001)
        subplot(2,2,4)
        plot(t,m.^3)
        xlim([0 5])
        xlabel('Time(ms)')
        ylabel('m^3')
        title('m^3 vs t')
        hold on
        pause(0.001)
    end
end
    