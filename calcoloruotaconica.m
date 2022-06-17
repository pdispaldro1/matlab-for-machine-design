function Tabella_ruota_conica = calcoloruotaconica(~)

disp("Questo tool permette di calcolare il valore del modulo esterno della ruota conica, utilizzando la teoria di Lewis per via iterativa")


n = input ("Inserisci il numero di giri: "); %questo è il numero di giri in ingresso
omega = n*0.1047; %questa è la velocità angolare
Pt = 1000 * input ("Inserisci il valore della potenza in KW: "); %questo è il valore della potenza del riduttore fornito 
C = 1000 *(Pt/omega); %questo è il valore della coppia o momento torcente
tau = input ("Inserisci il valore di tau: "); %questo è il valore del rapporto di trasmissione indicato come rapporto tra i diametri delle ruote
phi1 = atand (tau); %angolo phi1 ricavato come arcotangente del tau agente sull'accoppiamento
phi2 = 90 - phi1; %angolo phi2 ricavato con relazione geometrica
angoli_phi = [phi1, phi2] 
disp("Questo vettore restituisce i valori degli angoli phi e phi2 in maniera ordinata")
bvc = input ("Inserisci il valore del rapporto b/vc: "); %questo è il rapporto geometrico tra il valore della larghezza della ruota e la profondità 
z = input ("Inserisci il valore del numero di denti: "); %questo è il numero di denti che deve avere la ruota dentata
lambda = ((z)/(((2/bvc)-1)*sind(phi1))) %questo è il valore calcolato di lambda per le ruote dentate 
disp("Questo è il valore di lambda calcolato")
sigma_adm_pt = 9.807 * input ("Inserisci il valore della sigma ammissibile: "); %questo è il valore della sigma ammissibile
alfa_pt = 0.7; %questo è il valore di alfa di primo tentativo preso pari a 0.7
k = 0.73; %questo è il valore di k assunto sempre pari a 0.73
mmedio_pt = k*((C/(lambda*alfa_pt*sigma_adm_pt))^(1/3)) %questo è il valore del modulo medio di primo tentativo
raggio_ext_pt = (mmedio_pt/2) + (z + (lambda*sind(phi1))); %questo è il valore di primo tentativo del raggio esterno
modulo_ext_pt = (mmedio_pt) * (1 + (lambda*sind(phi1)/z)) %questo è il valore di primo tentativo del modulo esterno
modulo_ext_uni = input ("Inserisci il valore del modulo esterno unificato: "); %questo è il valore del modulo unificato
modulo_m_fittizio = (modulo_ext_uni)/(1 + (lambda*sind(phi1)/z)) %questo è il valore del modulo m fittizio
rm = (z*modulo_m_fittizio)/2; %questo è il raggio medio
vp = (omega * rm)/1000; %questa è la velocità periferica
alfa = 6/(6+vp); %questo è il valore di alfa
valori_primo_tentativo = [mmedio_pt,modulo_ext_pt,modulo_m_fittizio,modulo_ext_uni,alfa,rm]'; %questo è il vettore dei valori di primo tentativo

if modulo_ext_pt > modulo_ext_uni
    modulo_ext_uni = input("Inserisci un altro valore più grande del modulo esterno unificato: ");
else
    %Il modulo unificato va bene così
end

for iteration = 1:5
    mmedio = k*((C/(lambda*alfa*sigma_adm_pt))^(1/3));
    modulo_ext = (mmedio) * [1 + (lambda*sind(phi1)/z)];
    modulo_m_fittizio_i = (modulo_ext_uni)/(1 + (lambda*sind(phi1)/z));
    modulo_ext_unificato = modulo_ext_uni;
    rm = (z*modulo_m_fittizio_i)/2;
    vpi = (omega*rm)/1000;
    alfa= 6/(6+vpi);
end

if modulo_ext > modulo_ext_unificato 
    modulo_ext_unificato = input ("Inserisci un altro valore del modulo esterno unificato perchè il valore ricavato per iterazione supera il valore del modulo esterno unificato: ");
else
    %Il modulo unificato non deve essere cambiato
end

if (modulo_ext_unificato-modulo_ext)/modulo_ext_unificato >= 0.02
    bvc = input ("Inserisci un nuovo valore di b/vc poichè NON sei vicino alla convergenza del valore di m: ");
    lambda = round((z)/[((2/bvc)-1)*sind(phi1)]);
else
    disp ("Sei a convergenza!")
end

valori_ruota =[]; %questo è il vettore vuoto relativo che verrà riempito coi valori sia di primo tentativo che ricavati

for iteration = 1:5
    mmedio = k*((C/(lambda*alfa*sigma_adm_pt))^(1/3));
    modulo_ext = (mmedio) * [1 + (lambda*sind(phi1)/z)];
    modulo_m_fittizio_i = (modulo_ext_unificato)/(1 + (lambda*sind(phi1)/z));
    rm = (z*modulo_m_fittizio_i)/2;
    vpi = (omega*rm)/1000;
    alfa= 6/(6+vpi);
    dati_ruota = [mmedio;modulo_ext;modulo_m_fittizio_i;modulo_ext_unificato;alfa;rm];
    valori_ruota = [valori_ruota, dati_ruota];
end

valori_ruota;
matrice_completa_no_indici = [valori_primo_tentativo,valori_ruota]; %questa è la matrice completa che comprende TUTTI i valori finora trattati a meno degli indici

i1 = "Modulo_medio"; 
i2 = "Modulo_esterno";
i3 = "Modulo_m_fittizio";
i4 = "Modulo_esterno_unificato";
i5 = "Fattore alfa";
i6 = "Raggio medio";
indici = [i1,i2,i3,i4,i5,i6]'; %vettore contenente tutti gli indici
Valori_della_ruota_iterati = [indici, matrice_completa_no_indici]; %matrice che contiene tutti i valori comprensivi degli indici
Tabella_valori_ruota_conica =array2table(Valori_della_ruota_iterati); %la matrice è stata trasformata in una tabella
newnames =["Valori_calcolati", "Primo_tentativo","Iterazione1","Iterazione2","Iterazione3","Iterazione4","Iterazione5"]; %ridenominazione delle intestazioni della tabella
Tabella_ruota_conica = renamevars(Tabella_valori_ruota_conica,1:width(Tabella_valori_ruota_conica),newnames); %comando che provvede alla ridenominazione
writetable(Tabella_ruota_conica, "tabellaruotaconica.xls") %comando che scrive la tabella su excel

disp("I valori sia di primo tentativo che quelli ottenuti a seguito delle iterazioni sono contenuti nell'apposita tabella")

end


