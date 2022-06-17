function dimensioniforzamento = dimensionamentoforzamento(~)

disp("Questo tool permette di dimensionare il collegamento albero-mozzo mediante forzamento a caldo")

d_albero = input("Inserisci il diametro dell'albero: "); %valore del diametro dell'albero
d_mozzo = input("Inserisci il diametro del mozzo: "); %valore del diametro del mozzo
mt = input("Inserisci il valore del momento torcente agente sull'albero in Nm: "); %inserisci il valore del momento torcente agente sull'albero in Nm
n = input("Inserisci il valore del coefficiente di sicurezza allo scorrimento: "); %valore del coefficiente di sicurezza allo scorrimento
k = input("Inserisci il valore del rapporto di interferenza i/d: "); %valore del rapporto di interferenza i/d
alfa = d_albero/d_mozzo; %valore del rapporto tra diametro dell'albero e diametro del mozzo
f = input("Inserisci il valore del fattore di attrito all'interfaccia del forzamento: "); %valore del coefficiente di attrito all'interfaccia del forzamento che di solito è 0.15 per interfaccia acciaio-acciaio
E = input("Inserisci il valore del modulo di Young in MPa: "); %valore del modulo di Young in MPa che per gli acciai è 210000 MPa in genere
p = k/2*(E*(1-alfa^2)) %valore della pressione di forzamento
disp("Questo è il valore della pressione di forzamento")

l = 2000*mt/(f*p*pi*d_albero^2) %valore della lunghezza minima del collegamento
disp("Questa è la lunghezza minima del collegamento")

l_maggiorato = n*l %valore della lunghezza del collegamento maggiorata col coefficiente di sicurezza allo scorrimento
disp("Questa è la lunghezza, opportunamente maggiorata mediante il coefficiente di sicurezza allo scorrimento, del collegamento")
end




