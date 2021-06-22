%-------------------------------------------------------------------------%
% Author          : Urvi Mishra  
% Date            : 1-June-2018                                          %
%-------------------------------------------------------------------------%


gNam=120;
m0=0.06;h0=0.6;
ENa=54.2;
gkm=30;
n0=0.24;
Vr=-68;
e=exp(1);
Ek=-74.7;
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
    an=(0.01)*(10-v)/(e^((10-v)/10)-1);
    bn=0.125*e^(-v/80);
    tn=1/(an+bn);
    ninf=an/(an+bn);
    for t= (0:0.02:5)
        t=[0:0.02:5];
        m=minf-(minf-m0)*e.^(-t/tm);
        h=hinf-(hinf-h0)*e.^(-t/th);
        gNa=gNam*(m.^3).*h;
        iNa=gNa*(Vm-ENa);
        n=(ninf-((ninf-n0).*e.^(-t/tn)));
        gk=gkm*(n.^4);
        ik=gk*(Vm-Ek);
        Im=ik+iNa;
        figure(4)
        plot(t,Im/1000,'LineWidth',1)
        hold on
        pause(0.001)
        title('Membrane Current')
        xlabel('Time(ms)')
        ylabel('Im(mA)')
    end
end