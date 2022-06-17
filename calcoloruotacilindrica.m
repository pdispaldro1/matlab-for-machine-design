function Tabella_valori_ruota = calcoloruotacilindrica(~)

disp("Questo tool permette di calcolare il valore del modulo della ruota cilindrica, utilizzando la teoria di Lewis per via iterativa")

n = input ("Inserisci il numero di giri: "); %valore del numero di giri dato 
omega = n*0.1047; %valore della velocità angolare
Pt = 1000 * input ("Inserisci il valore della potenza in KW: "); %valore della potenza dato 
C = 1000 *(Pt/omega); %valore della coppia
tau = 1;
zmin = round (17/tau); %valore del numero di denti
lambda = input ("Inserisci il valore di lambda: "); %valore del coefficiente lambda assegnato a scelta
sigma_adm = 9.807 * input ("Inserisci il valore della sigma ammissibile: "); %valore della sigma ammissibile
alfa_pt = 0.7; %valore dell'alfa di primo tentativo supposta 0.7
k = 0.73; %valore del coefficiente k
mlewis = k*((C/(lambda*alfa_pt*sigma_adm))^(1/3)) %valore del modulo di lewis
mu = input ("Inserisci il valore del modulo unificato: "); %valore tabellato del modulo unificato intero superiore subito maggiore del modulo di lewis
raggio_medio = (zmin*mlewis)/2; %valore del raggio medio della ruota
vp = (omega*raggio_medio)/1000; %valore della velocità periferica
alfa = 6/(6 + vp); %valore del coefficiente di sicurezza alfa da iterare
valori_primo_tentativo = [mlewis,raggio_medio,vp,alfa]'; %valori di primo tentativo di modulo di lewis, del raggio medio, della velocità periferica e di alfa

for iteration = 1:7
    m = k*((C/(lambda*alfa*sigma_adm))^(1/3));
    raggio = (zmin*m)/2;
    vpi = (omega*raggio)/1000;
    alfa= 6/(6+vpi);
end

if m>mu 
    mu = input ("Inserisci un altro valore del modulo unificato perchè il valore ricavato per iterazione supera il valore del modulo unificato: ");
else
    %Il modulo unificato non deve essere cambiato
end

if (mu-m)/mu >= 0.02
    lambda = input ("Inserisci un nuovo valore di lambda poichè non sei vicino alla convergenza del valore di m: ");
    sigma_adm = 9.807 * input ("Inserisci un nuovo valore della sigma ammissibile poichè non sei vicino alla convergenza del valore di m: ");
else
    disp ("Sei a convergenza!")
end

valori_ruota =[]; %vettore vuoto in cui inserire in seguito i valori trovati per via iterativa
for iteration = 1:7
    m = k*((C/(lambda*alfa*sigma_adm))^(1/3));
    raggio = (zmin*m)/2;
    vpi = (omega*raggio)/1000;
    alfa= 6/(6+vpi);
    dati_ruota = [m,raggio,vpi,alfa];
    valori_ruota = [valori_ruota, dati_ruota];
end

if (mu-m)/mu >= 0.02
    disp ("Resetta la funzione e inserisci altri valori di lambda e sigma ammissibile")
else
    disp ("Sei a convergenza!")
end

valori_ruota; %matrice coi valori della ruota
matrice_valori_ruota = reshape(valori_ruota,[4,7]);

%la matrice restituisce tutti i valori di m, raggio medio, velocità
%periferica e alfa fattore di sicurezza andando avanti con le iterazioni.
%L'ultima iterazione si trova nell'ultima colonna a destra
matrice_completa_no_indici = [valori_primo_tentativo,matrice_valori_ruota];
i1 = "Modulo_m";
i2 = "Raggio_medio";
i3 = "Velocità_periferica";
i4 = "Fattore_alfa";
indici = [i1,i2,i3,i4]';
Valori_della_ruota_iterati = [indici, matrice_completa_no_indici]; %matrice coi valori della ruota e gli indici associati
Tabella_ruota =array2table(Valori_della_ruota_iterati); %trasformazione della matrice in una tabella
newnames =["Valori_calcolati", "Primo_tentativo","Iterazione1","Iterazione2","Iterazione3","Iterazione4","Iterazione5","Iterazione6","Iterazione7"]; %nuove intestazioni della tabella

Tabella_valori_ruota = renamevars(Tabella_ruota,1:width(Tabella_ruota),newnames); 
writetable(Tabella_valori_ruota, "tabellaruotacilindrica.xls")

end

