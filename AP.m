%-------------------------------------------------------------------------%
% Author          : Urvi Mishra  
% Date            : 1-June-2018                                          %
%-------------------------------------------------------------------------%

ENa = 54.2 ; EK = -74.7 ; E1 = -65.8 ; Erest = -68 ;
n = 0.3; m = 0.06; h = 0.6;
GK = 12 ; GNa = 30; G1 = 0.001 ;
Cm = 1;
Vm = Erest;
e=exp(1);
dt=0.05;
t=0;
VM=[];
N=[];
M=[];
H=[];
GNA=[];
G_K=[];
for t=(0:0.05:5);
    v=Vm-Erest;
    if (t<0.30)&&(t>=0);
        Id=75;
    else Id=0;
    end  
    t=(0:0.05:5);
    am=(0.1)*(25-v)/(e^((25-v)/10)-1);
    bm=4*e^(-v/18);
    ah=0.07*e^(-v/20);
    bh=1/(e^((30-v)/10)+1);
    an=(0.01)*(10-v)/(e^((10-v)/10)-1);
    bn=0.125*e^(-v/80);
    dn = dt*(((an)*(1- n))-((bn)*n)); 
    dm = dt*(((am)*(1-m))-((bm)*m));
    dh =dt*(((ah)*(1- h))-((bh)*h));
    n=n+dn;
    m= m+dm;
    h=h+dh;
    gk=GK*n.^4;
    gNa=GNa*(m.^3).*(h);
    Ik=gk.*(Vm-EK);
    INa=gNa.*(Vm-ENa);
    I1=G1.*(Vm-E1);
    dVm = dt*(Id-(INa + Ik + I1))/Cm;
    Vm =Vm+dVm;
    VM=[VM Vm];
    N=[N n];
    M=[M m];
    H=[H h];
    GNA=[GNA gNa];
    G_K=[G_K gk];
    
end
figure(1)
plot(t,VM)
hold on
pause(0.001)
title('Action potential(mV)')
xlabel('Time(ms)')
ylabel('Membrane potential')
figure(2)
plot(t,N);
hold on
pause(0.001)
title('Action potential')
xlabel('Time(ms)')
ylabel('parameter')
plot(t,M);
plot(t,H);
figure(3)
plot(t,GNA)
hold on
pause(0.001)
title('Action potential-Ionic conductance')
xlabel('Time(ms)')
ylabel('Ionic conductance(s/cm^2)')
plot(t,G_K)
