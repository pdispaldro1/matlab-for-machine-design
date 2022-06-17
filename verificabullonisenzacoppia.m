function verificasenzacoppia = verificabullonisenzacoppia(~)

f = 9.807*input("Inserisci il valore in kg della forza che deve reggere il bullone: "); %valore in kg della forza agente sul bullone
d = input ("Inserisci il valore in mm del diametro del bullone: "); %valore del diametro del bullone
a_res = input ("Inserisci il valore di Ares ricavato dalla normativa UNI 10011 relativo al diametro scelto: "); %valore di ares ricavato dalla UNI 10011 relativa al diametro scelto
classe = input ("Inserisci il numero della classe del bullone: "); %valore della classe del bullone
fkn = input ("Inserisci il valore tabellato di fkn: "); %valore tabellato di fkn
ns = 0.8*fkn*a_res; %valore della forza di precarico
ts = 0.2*ns*d; %valore della coppia di serraggio del bullone

valori_tensione = [ns;ts] %valori di ns e ts agenti sul bullone
disp("Questi sono i valori di Ns e Ts agenti sul bullone")

mu = input("Inserisci il valore del coefficiente di attrito mu: "); %valore del coefficiente di attrito dell'interfaccia col bullone
nif = 1.25; %valore del coefficiente di sicurezza derivante dall'attrito nelle tramsissioni
vf = (mu*ns)/nif; %valore della forza tangenziale di scorrimento

nb = f/vf %valore del numero di bulloni
nbdefinitivo = ceil(nb) %valore del numero minimo di bulloni che reggono la sollecitazione

disp("Il valore ricavato restituisce il numero di bulloni minimo per reggere la sollecitazione ")

tau_b = f/(nb*a_res) %valore del tau calcolato sul bullone

alfa = input ("Inserisci il valore di alfa: ");
tau_b_adm = input("Inserisci il valore della tau ammissibile del bullone: ")
if tau_b <= tau_b_adm
    disp ("Il bullone è verificato a resistenza coi dati inseriti")
else
    disp ("Il bullone NON è verificato a resistenza coi dati inseriti")
end

sigma_adm_lamiera = input ("Inserisci il valore in N/mm^2 della sigma ammissibile della lamiera: "); %valore della sigma ammissibile dalla lamiera
b = input ("Inserisci il valore in mm dello spessore della lamiera: "); %valore dello spessore della lamiera

sigma_rif = f/(b*d*nb) %valore della tensione convenzionale

if sigma_rif <= alfa*sigma_adm_lamiera
    disp("La lamiera è verificata a rifollamento")
else 
    disp("La lamiera NON è verificata a rifollamento")
end
end





