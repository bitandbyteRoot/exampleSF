clearvars; 

tic
periodo = 3;
amplitud = 4;
syms n
syms t

dt = amplitud*diff(t);
T = 1/periodo;
a0 = T*int(dt,0,periodo/2);


funAN = cos((2*pi)/periodo*n*t);
aN = 2*T*int(funAN*dt,0,periodo/2);

funBN = sin((2*pi)/periodo*n*t);
bN = 2*T*int(funBN*dt,0,periodo/2);

serFourier =  aN*cos((2*pi)/periodo*n*t)+bN*sin((2*pi)/periodo*n*t);

sumatoria = 0;
componentes = 200;
sampling = 1e-3;
t = 0:sampling:5-sampling;
serFourier = subs(serFourier,t);
for k = 1:componentes
    n = 2*k-1;
    serie=double(subs(serFourier));
    sumatoria = serie+sumatoria;
end

sumatoria = double(a0)+sumatoria;
plot(t,sumatoria,'LineWidth',3)

toc

%%
tic
sumatoria = 0;
componentes = 200;
sampling = 1e-3;
periodo = 1;
amplitud = 0.5;
t = 0:sampling:10-sampling;

for k = 1:componentes
    n = 2*k-1;
    serie=amplitud*(2/pi)*1/n*sin(((2*pi)/periodo)*n*t);
    sumatoria = serie+sumatoria;
end

sumatoria = (((periodo/2)*amplitud)/periodo)+sumatoria;
plot(t,sumatoria,'LineWidth',3)
toc


