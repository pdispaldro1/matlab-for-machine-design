function sigma_max = hertz(~)

disp ("Questo tool permette di calcolare il valore minimo della durezza Brinell dell'acciaio da usare, rispettando la teoria di Hertz")

n = input ("Inserisci il numero di giri: "); %valore del numero di giri in ingresso
tau = input ("Inserisci il valore di tau: "); %valore del rapporto di trasmissione dell'accoppiamento
raggio = input ("Inserisci il valore in mm del raggio: "); %valore del raggio della ruota
b = input ("Inserisci il valore in mm della larghezza del dente della ruota: "); %valore della larghezza del dente della ruota
omega = n*0.1047; %valore della velocità angolare
Pt = 1000 * input ("Inserisci il valore della potenza in KW: "); %valore della potenza in ingresso dato dal professore
E = input ("Inserisci il valore del modulo di Young in MPa: "); %valore del modulo di young dell'acciaio in MPa
C = (Pt/omega); %valore della coppia o momento torcente
alfa = input ("Inserisci il valore del fattore di sicurezza :"); %valore del fattore di sicurezza alfa
sigma_quadro = ((1000*C*E*(1+tau))/(b*(raggio^2)*sind(40))); %valore quadratico del sigma che serve per calcolare la massima sollecitazione
sigma = 0.59*sqrt(sigma_quadro); %valore della massima sollecitazione 

HB_min = (sigma)/(0.25*alfa*9.807) %valore della HB minima da considerare per il dimensionamento a fatica

disp("Questo valore di HB è il valore minimo da considerare per un corretto dimensionamento secondo la teoria di Hertz")

end
