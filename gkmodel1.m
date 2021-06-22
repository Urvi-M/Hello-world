%-------------------------------------------------------------------------%
% Author          : Urvi Mishra  
% Date            : 1-June-2018                                          %
%-------------------------------------------------------------------------%

gkm=30;
n0=0.24;
Vr=-68;
e=exp(1);
Ek=-74.7;
for Vm =-50:-10:-120;
    v=Vm-Vr;
    an=(0.01)*(10-v)/(e^((10-v)/10)-1);
    bn=0.125*e^(-v/80);
    tn=1/(an+bn);
    ninf=an/(an+bn);
    for t=0:0.02:5;
        t=[0:0.02:5];
        n=(ninf-((ninf-n0).*e.^(-t/tn)));
        gk=gkm*(n.^4);
        ik=gk*(Vm-Ek);
        figure(6)
        subplot(2,2,1)
        plot(t,gk,'LineWidth',1);
        title('gk conductance model')
        xlabel('Time(ms)')
        ylabel('gk')
        hold on
        subplot(2,2,2)
        plot(t,ik,'LineWidth',1)
        xlabel('Time(ms)')
        ylabel('Ik')
        title('ik vs t')
        hold on
        pause(0.001)
        subplot(2,2,3)
        plot(t,n,'LineWidth',1)
        xlabel('Time(ms)')
        ylabel('n')
        title('n vs t')
        hold on
        pause(0.001)
        subplot(2,2,4)
        plot(t,n.^4,'LineWidth',1)
        xlabel('Time(ms)')
        ylabel('n^4')
        title('n^4 vs t')
        hold on
        pause(0.001)
    end
end
