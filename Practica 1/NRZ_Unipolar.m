%% C�digos de L�nea (Codificiaci�n NRZ Unipolar) LAB1 EC3423 (Comunicaciones II) Universidad Sim�n Bol�var
%Armando Longart 10-10844
%Yurjelis Brice�o 11-11371
% Juan Soto 09-10822
%% Funci�n NRZ_Unipolar
%Entrada: secuencia de bits, la tasa de bits y la amplitud
%Salida: eje del tiempo, se�al de salida, frecuencia de muestreo

function [t,x,fs]=NRZ_Unipolar(secuencia,tasa_b,A)
%comprobar estos vectores de tiempo.
T=length(secuencia)/tasa_b; %tiempo total de la secuencia de bits
n=500;                      %numero de muestras
N=n*length(secuencia);      %longitud de la secuencia de bits
dist_t=T/N;
fs=1/dist_t;                %frecuencia de muestreo
t=0:dist_t:T;               %eje del tiempo
x=zeros(1,length(t));       %se�al de salida
for i=0:length(secuencia)-1
    if secuencia(i+1)==1
        x(i*n+1:(i+1)*n)=A;
    else 
        x(i*n+1:(i+1)*n)=0;
    end
end
figure;
plot(t,x,'Linewidth',2);
grid
axis([0 N*dist_t -2*A 2*A])
title('Codificaci�n NRZ Unipolar')
end

