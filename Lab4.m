% LABORATORIO DE TRANSFORMADA DE FOURIER
% 
% Pero Guillem
% Luisa Fernand Echeverry Gómez 
% Diana Nuñez
% Angela Ardila
clc, clear , close all
delete(instrfind({'Port'},{'COM3'})); %%creando puerto serial  


%% Punto 1. Caracterización e identificación de
%señales mezacladas. 
% 1.1 Leer archivo .txt 
A= textread ('signal.txt');
A = A';
deltaMuestra = 1/1000; % El tiempo que toma la muestra. 
deltaMuestra = deltaMuestra*10^3; % Pasar a milisegundos
tiempo = 0:(length(A)-1); % Se crea el vector de tiempos, con la cantidad de muestras.
tiempo = deltaMuestra*tiempo;% Vector de tiempos final



subplot(2,4,1);
ylabel('Voltaje de señal [mV]');
xlabel('Tiempo [ms]');
title ('Señal');
plot(A);


Esp=fft(A);
Esp=abs(Esp);
subplot(2,4,2);
plot(Esp)

EscalonUnitario = Uni(70,length(Esp));
Filtro=EscalonUnitario.*Esp;
subplot(2,4,3);
plot(Filtro)


ECG=ifft(Filtro);
ECG=abs(ECG);
ECG=detrend(ECG);
subplot(2,4,4);
plot(ECG)

load('ECGsinQRS.mat');
subplot(2,4,5);
plot(ECG_SINQRS)

EspSINQRS=fft(ECG_SINQRS);
EspSINQRS = abs(EspSINQRS);
subplot(2,4,6);
plot(EspSINQRS)

Diferencia = Filtro-EspSINQRS;

subplot(2,4,7);
[d, pos] = max(Diferencia);
plot (Diferencia);

figure(2)
hold on;
repetir = 50;
xl = 0;
xh = 1000;
x = 0;
resolucion = 5;

for m=1:repetir
    for i=1:resolucion:1000
        x = x + resolucion; 
        
        if i <= 970
            if i > 30
               in = i-30;
            else
               in = i;
            end
            
            ventana = sacarventana(ECG,in,(i+30)); %Ventana con fourier incluido
            subplot(2,1,1);
            plot(ventana); %dibujamos fourier de ventana
            ylim([0 2000]);
            xlim([0 100]);
            
        end
        
        subplot(2,1,2);
        hold on;
        if(ventana(1,15) > 800)
            %fprintf(arduino,'%d\n',1);
            plot(x,ECG(1,i),'r--o'); %
        else
            %fprintf(arduino,'%d\n',0);
            plot(x,ECG(1,i),'b--o'); %
        end
        ylim([0 400]);
        drawnow;
                
        if m >= 2
          xl = xl+resolucion;
          xh = xh+resolucion;
          xlim([xl xh]);
        end
        
    end
end
%delete(instrfind({'Port'},{'COM3'})); %%creando puerto serial  










