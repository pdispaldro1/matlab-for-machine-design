function fatica = calcolofatica(~)

n = input ("Inserisci il numero di sezioni che compongono l'albero: ");

valori_sigma = []; %vettore vuoto che comprenderà in seguito tutti i valori delle sigma per ogni sezione

for iteration = 1:n
    mxy = input ("Inserisci il valore di Mxy in Nmm: "); %momento flettente agente su piano xy
    myz = input ("Inserisci il valore di Myz in Nmm: "); %momento flettente agente su piano yz
    mt = input ("Inserisci il valore del momento torcente in Nmm: "); %momento torcente
    d = input ("Inserisci il valore del diametro della sezione in mm: "); %diametro dello spallamento, tenendo conto che la sezione più grande dell'albero non va considerata
    sigma_vm = sqrt((mxy^2)+(myz^2)+(0.75*(mt^2))); %sigma ideale calcolata alla von mises
    sigma_sezione = (32/(pi*d^3))*sigma_vm; %sollecitazione agente su ogni sezione
    valori_sigma = [valori_sigma, sigma_sezione]; %vettore con le sigma per ogni sezione
end

valori_sigma %vettore coi sigma per ogni sezione 

disp("Mediante questo vettore ordinato da sx verso dx dalla prima all'ultima sezione si può vedere la sezione maggiormente sollecitata")

sigma_adm = input ("Inserisci il valore della sigma ammissibile in N/mm^2:"); %valore della sigma ammissibile
sigma_rottura = 4*sigma_adm; %carico di rottura
sigma_sn = 0.68*sigma_rottura; %carico di snervamento
delta_sigma_l = 0.56*sigma_rottura; %resistenza a oscillazione
Mt_sezione_max = input ("Reinserisci il valore del momento torcente in Nmm della sezione a massima sollecitazione: "); %momento torcente della sezione a massima sollecitazione
d_sezione_max = input ("Reinserisci il valore del diametro in mm della sezione a massima sollecitazione: "); %diametro della sezione a massima sollecitazione
mxy_sezione_max = input ("Reinserisci il valore del momento flettente in Nmm della sezione a massima sollecitazione sul piano xy: "); %momento flettente sul piano xy della sezione a massima sollecitazione
myz_sezione_max = input ("Reinserisci il valore del momento flettente in Nmm della sezione a massima sollecitazione sul piano yz: "); %momento flettente sul piano yz della sezione a massima sollecitazione
mfid = sqrt((mxy_sezione_max^2)+(myz_sezione_max^2)); %momento flettente ideale calcolato usando i momenti flettenti sui piani come componenti
delta_sigma = 0.10196*((32/(pi*d^3))*mfid); %ampiezza dell'oscillazione
sigma_m = 0.10196*(sqrt(3) * (16*Mt_sezione_max)/(pi*(d_sezione_max^3))); %tensione media

c1 = input ("Inserisci il valore di C1: "); %valore di c1 da ricavare da grafico
c2 = input ("Inserisci il valore di C2: "); %valore di c2 da ricavare da grafico

r= input ("Inserisci il valore in mm del raggio di raccordo: "); %valore del raggio di raccordo tra le sezioni, fondamentale per evitare gli effetti di intaglio
h = input ("Inserisci il valore in mm dell'altezza dello spallamento: "); %valore dell'altezza dello spallamento o della differenza tra i raggi delle sezioni
j = h/r; %rapporto geometrico tra altezza dello spallamento e raggio di raccordo
k = r/d_sezione_max; % %valore di r/d
w = (h+d_sezione_max)/(d_sezione_max); %valore di D/d
dati_grafico = [k;w] %vettore che restituisce i valori di r/d e D/d da usare per entrare nel grafico al fine di trovare kt
disp ("Questo vettore restituisce i dati, rispettivamente, di r/d e di D/d con cui entrare nel grafico per trovare kt")
kt = input ("Inserisci il valore di kt trovato in tabella: "); %valore di kt trovato dalle tabelle
q = input ("Inserisci il valore di q: "); %valore di q fattore di sensibilità all'intaglio a fatica
kf = 1 + q*(kt-1); %valore del coefficiente di intaglio a fatica
delta_sigma_l_eff = (c1*c2*delta_sigma_l)/kf %valore della delta sigma l efficace
p = [sigma_m,delta_sigma] %valore del punto di lavoro da inserire nel diagramma di Haigh
disp ("Questo è il punto di lavoro che dobbiamo andare a inserire nel diagramma di Haigh")

x = linspace (0,(sigma_rottura+20),20);
y1 = -(delta_sigma_l_eff/sigma_rottura)*x + delta_sigma_l_eff;
y2 = -(delta_sigma_l/sigma_sn)*x + delta_sigma_l;

figure
plot(x,y1,'r-',x,y2,'b-')
ylim([0 delta_sigma_l])
title("Diagramma di Haigh dell'albero")
xlabel("Sigma medio")
ylabel("Delta Sigma l")
hold on
plot(sigma_m,delta_sigma,'r.','MarkerSize',25)

ni = (1/((delta_sigma/delta_sigma_l_eff)+(sigma_m/sigma_rottura)))

if ni > 3
    disp("La verifica a fatica ha esito positivo!")
else
    disp ("La verifica a fatica purtroppo non ha avuto esito positivo, resetta la funzione e cambia alcuni parametri")
end
end
