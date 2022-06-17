function verificaconcoppia = verificabulloniconcoppia(~)

disp("Questo tool permette di verificare i bulloni e quindi le lamiere nel caso agisca una coppia")

f= 9.807*input("Inserisci il valore della forza di distacco in kg: "); %valore della forza di distacco in kg
n = input ("Inserisci il numero di giri: "); %valore del numero di giri
omega = n*0.1047; %valore della velocità angolare
Pt = input ("Inserisci il valore della potenza in KW: "); %valore della potenza del riduttore
C = 1000*(Pt/omega); %valore della coppia o momento torcente agente
rm = input ("Inserisci la distanza in mm dal centro del bullone: "); %valore della distanza in mm dal centro del bullone
ft = 9.807*(C/rm) %forza tangenziale agente sul bullone
disp("Questa è la forza tangenziale agente")

d = input ("Inserisci il valore in mm del diametro del bullone: "); %valore del diametro del bullone
fkn = input ("Inserisci il valore tabellato di fkn per il bullone in oggetto: "); %valore tabellato di fkn
a_res = input ("Inserisci il valore tabellato di ares per la classe scelta: "); %valore di ares per la classe di bulloni scelta
ns = 0.8*fkn*a_res; %valore della forza di precarico
ts = 0.2*ns*d; %valore della coppia di serraggio

valori_tensione = [ns;ts] %valori di forza di precarico e coppia di serraggio

disp("Questi sono i valori rispettivamente di ns forza di precarico e ts coppia di serraggio agenti sul bullone")

mu = input("Inserisci il valore di mu: "); %valore di mu coefficiente attrito all'interfaccia del bullone
nif = 1.25; %valore del coefficiente di sicurezza derivante dall'attrito nelle trasmissioni
vf = (mu*ns)/nif; %valore della forza tangenziale di scorrimento
vfin = vf*(1-(f/ns)) %valore finale della forza tangenziale di scorrimento
nb = ft/vfin %valore del numero di bulloni che servono per reggere la sollecitazione
disp("Qualsiasi numero di bulloni maggiore o uguale a quello trovato soddisfa la verifica a scorrimento")

nbdefinitivo = 1 +ceil(nb) %valore definitivo del numero minimo di bulloni che servono a reggere la sollecitazione

disp("Questo è il numero di bulloni definitivo, opportunamente maggiorato per restituire una ragionevole sicurezza")

ftb = ft/nbdefinitivo; %valore unitario della forza tangenziale agente sul singolo bullone
fb = f/nbdefinitivo; %valore unitario della forza di distacco agente sul singolo bullone

forze_singolo_bullone = [ftb;fb] %valori delle forze agenti sul singolo bullone
disp("Questi sono rispettivamente i valori della forza tangenziale e della forza di distacco agente sul singolo bullone")

sigma_adm = input("Inserisci il valore in N/mm^2 tabellato della sigma ammissibile: "); %valore tabellato della sigma ammissibile
tau_adm = input("Inserisci il valore tabellato in N/mm^2 della tau ammissibile: "); %valore tabellato della tau ammissibile

r = (((fb/a_res)/sigma_adm)^2)+(((ftb/a_res)/tau_adm)^2); %valore del coefficiente di resistenza

if r <=1
    disp("La verifica a resistenza ha esito positivo!")
else
    disp("La verifica a resistenza purtroppo NON ha esito positivo")
end

sigma_adm_lamiera = input("Inserisci il valore in N/mm^2 della sigma ammissibile per la lamiera: "); %valore della sigma ammissibile per la lamiera
alfa = input("Inserisci il valore del coefficiente alfa: "); %valore del coefficiente di sicurezza alfa
b = input("Inserisci lo spessore in mm della lamiera: "); %valore dello spessore della lamiera

f_rif = (ftb)/(b*d) %valore della sollecitazione di rifollamento

if f_rif <= 2*sigma_adm_lamiera
    disp("La verifica a rifollamento ha esito positivo!")
else 
    disp("La verifica a rifollamento NON ha esito positivo!")
end
end


