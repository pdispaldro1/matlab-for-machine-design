function dimensionilinguetta = dimensionamentolinguetta(~)

disp("Questo tool permette di calcolare la lunghezza della linguetta da applicare all'interfaccia albero-mozzo")

d = input("Inserisci il valore in mm del diametro dell'albero: "); %valore del diametro dell'albero
r=d/2; %valore del raggio dell'albero inteso come metà del diametro
mt = input("Inserisci il valore in Nmm del momento torcente agente sull'albero in Nm: "); %valore del momento torcente agente sull'albero in Nm
tau_amm = input("Inserisci il valore della tau ammissibile in kg/mm^2 agente sull'albero: "); %valore della tau ammissibile in kg/mm^2
tau = (2*mt*1000)/(9.807*pi*(r^3))

if tau < tau_amm
    disp("La verifica delle tensioni tangenziali ha esito positivo per il diametro scelto")
else
    disp("La verifica delle tensioni tangenziali NON ha esito positivo per il diametro scelto")
end

p_amm = input("Inserisci il valore della pressione ammissibile in kg/mm^2 agente sull'albero: "); %valore della pressione ammissibile in kg/mm^2
b = input("Inserisci il valore tabellato della b della linguetta: "); %valore tabellato di b della linguetta
h = input("Inserisci il valore tabellato della h della linguetta: "); %valore tabellato di h della linguetta

l = (10*mt*1000)/(9.807*d*h*p_amm) %valore della lunghezza minima della linguetta 

disp("Questo è il valore della minima lunghezza che deve avere la linguetta per verificare la condizione p<p_ammissibile")
end
