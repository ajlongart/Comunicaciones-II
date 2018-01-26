%% Códigos de Línea (Estimación de DEP: Densidad Espectral de Potencia) LAB1 EC3423 (Comunicaciones II) Universidad Simón Bolívar
%Armando Longart 10-10844
%Yurjelis Briceño 11-11371
%Juan Soto 09-10822
clear all
clc
%% Valores de entrada de las funciones
A = 1;      %Amplitud de los pulsos de salida
tasa_b = 5; %Tasa de bits de la codificación

%% Secuencias aleatorias de bits
secuencia1 = randi([0 1],6,1)';
secuencia2 = randi([0 1],50,1)';
secuencia3 = randi([0 1],1000,1)';

%% LLamado a las funciones
[t1,y1,f1] = NRZ_Unipolar(secuencia1, tasa_b, A);
[t2,y2,f2] = NRZ_Unipolar(secuencia2, tasa_b, A);
[t3,y3,f3] = NRZ_Unipolar(secuencia3, tasa_b, A);

%% Estimación y gráfica de DEP de NRZ Unipolar para 3 secuencias
%y2(numel(y3)) = 0;
%y1(numel(y3)) = 0;

% ejef = 0:fs/length(y):fs/N; Eje de frecuencia si se quiere sólo la mitad del espectro

y1_corr = xcorr(y1);            %La estimación se da a través de la función de autocorrelación de la salida
maxy1 = max(y1_corr);           %Para normalizar la autocorrelación se le saca el máximo del arreglo y se normaliza
y1_corr = y1_corr/maxy1;        %respecto a ese valor máximo
Y1fft = fftshift(fft(y1_corr)); %FFT de la función de autocorrelación
N=length(Y1fft);
Y1fft = Y1fft/length(y1_corr);
Sx1 = (Y1fft.*conj(Y1fft));     %La DEP se obtiene multiplicando la FFT por su conjugada
ejef1=-f1/2:f1/N:f1/2-f1/N;     %Eje de frecuencia si se quiere todo el espectro

y2_corr = xcorr(y2);
maxy2 = max(y2_corr);
y2_corr = y2_corr/maxy2;
Y2fft = fftshift(fft(y2_corr));
N=length(Y2fft);
Y2fft = Y2fft/length(y2_corr);
Sx2 = (Y2fft.*conj(Y2fft));
ejef2=-f1/2:f1/N:f1/2-f1/N;

y3_corr = xcorr(y3); 
maxy3 = max(y3_corr);
y3_corr = y3_corr/maxy3;
Y3fft = fftshift(fft(y3_corr));
N=length(Y3fft);
Y3fft = Y3fft/length(y3_corr);
Sx3 = (Y3fft.*conj(Y3fft));
ejef3=-f1/2:f1/N:f1/2-f1/N;


%Gráfica de las DEP
figure;
plot(ejef1,Sx1,'Color','r');
hold on
plot(ejef2,Sx2,'Color','b');
hold on
plot(ejef3,Sx3,'Color','g');
grid on;
hold off

%% Estimación y gráfica de DEP de NRZ Unipolar para 3 secuencias (usando pwelch)
% figure;
% subplot(3,1,1)
% pwelch(y1,500,[],[],f1);
% subplot(3,1,2)
% pwelch(y2,500,[],[],f2);
% subplot(3,1,3)
% pwelch(y3,500,[],[],f3);

%% 
%Llamado a funciones, estimación y gráfica de DEP de NRZ Unipolar, NRZ Bipolar 
%y Manchester para secuencia 1000bits (pwelch)
[t4,y4,f4] = NRZ_Bipolar(secuencia3, tasa_b, A);
[t5,y5,f5] = Manchester(secuencia3, tasa_b, A);

y4_corr = xcorr(y4);
maxy4 = max(y4_corr);
y4_corr = y4_corr/maxy4;
Y4fft = fftshift(fft(y4_corr));
N=length(Y4fft);
Y4fft = Y4fft/length(y4_corr);
Sx4 = (Y4fft.*conj(Y4fft));
ejef4=-f1/2:f1/N:f1/2-f1/N;

y5_corr = xcorr(y5);
maxy5 = max(y5_corr);
y5_corr = y5_corr/maxy5;
Y5fft = fftshift(fft(y5_corr));
N=length(Y5fft);
Y5fft = Y5fft/length(y5_corr);
Sx5 = (Y5fft.*conj(Y5fft));
ejef5=-f1/2:f1/N:f1/2-f1/N;

figure;
plot(ejef3,Sx3,'Color','r');
hold on
plot(ejef4,Sx4,'Color','b');
hold on
plot(ejef5,Sx5,'Color','g');
grid on;
hold off

%% Estimación y gráfica de DEP de NRZ Unipolar para 3 secuencias (usando pwelch)
% figure;
% subplot(3,1,1)
% pwelch(y3,500,[],[],f3);
% subplot(3,1,2)
% pwelch(y4,500,[],[],f4);
% subplot(3,1,3)
% pwelch(y5,500,[],[],f5);
