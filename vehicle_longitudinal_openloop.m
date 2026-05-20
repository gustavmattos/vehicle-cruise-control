clc
clear
close

%% parametrização inicial

m = 1322; %[kg] massa do veiculo
cd = 0.29; %[-] coeficiente de arrasto
pmax = 192*735.5; %[W] potencia maxima
vmax = 215/3.6; %[m/s] velocidade maxima
g = 9.82; %[m/s²] aceleração gravidade
A = 2.16; %[m²] area frontal
rho = 1.29; %[kg/m³]densidade do ar
c = 0.5*rho*A*cd; %coeficiente de arrasto
fmax = pmax/vmax; %força máxima
%% ajustes do atrtito viscoso
b = (fmax - c*vmax^2)/vmax 
%% simulação
alpha =0;
sim('vehicle_longitudinal_openloop')
v= ans.v.Data;
t= ans.v.Time;
F= ans.F.data;

%% gráficos
plot(t,v*3.6)
xlabel('tempo[s]')
ylabel('velocidade [km/h]')
grid
return