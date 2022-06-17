function dimensionamento_albero_no_fatica = dimensionamentosenzafatica(~)

disp("Questo tool permette di fare il dimensionamento dell'albero senza considerare gli effetti della fatica " + ...
    "sulla base dei valori delle caratteristiche della sollecitazione ricavati dallo studio degli alberi come travi")

mxy1 = input ("Inserisci il valore del momento flettente sul piano XY della prima sezione: "); %valore del momento flettente sul piano xy della prima sezione    
mxz1 = input ("Inserisci il valore del momento flettente sul piano XZ della prima sezione: "); %valore del momento flettente sul piano xz della prima sezione
mt1 = input ("Inserisci il valore del momento torcente agente sulla prima sezione: "); %valore del momento torcente agente sulla prima sezione

mxy2 = input ("Inserisci il valore del momento flettente sul piano XY della seconda sezione: "); %valore del momento flettente sul piano xy della seconda sezione
mxz2 = input ("Inserisci il valore del momento flettente sul piano XZ della seconda sezione: "); %valore del momento flettente sul piano yz della seconda sezione
mt2 = input ("Inserisci il valore del momento torcente agente sulla seconda sezione: "); %valore del momento torcente agente sulla seconda sezione

mid1= sqrt((mxy1^2)+(mxz1^2)+(0.75*(mt1^2))) %valore del momento ideale agente sulla prima sezione
mid2= sqrt((mxy2^2)+(mxz2^2)+(0.75*(mt2^2))) %valore del momento ideale agente sulla seconda sezione

if mid1>mid2
    disp("La sezione più sollecitata è la prima!")
else 
    disp("La sezione più sollecitata è la seconda!")
end

mid= input ("Inserisci il valore del momento flettente della sezione più sollecitata: "); %valore del momento ideale agente sulla sezione più sollecitata
mt = input ("Inserisci il valore del momento torcente: "); %valore del momento torcente agente 
sigma_adm = input ("Inserisci il valore della sigma ammissibile: ") %valore della sigma ammissibile

disp ("Sulle ruote di pezzo la sigma ammissibile è pari a quella di quella degli alberi")

dmin= ((32*mid)/(pi*sigma_adm*9.81))^(1/3) %valore del diametro minimo per cui ho una prima verifica

disp ("Questo è il diametro minimo per cui si ha una prima verifica")

ni = input ("Inserisci il valore del modulo di Poisson: "); % valore del modulo di Poisson e in genere il modulo di Poisson per acciai è pari a 0.33
E= input ("Inserisci il valore del modulo di Young in Mpa: "); %valore del modulo di Young in MPa e in generale il modulo di Young per acciai è pari a 210000 Mpa
G = (E/(2*(1+ni))); %valore del modulo di taglio
Jo = (2*pi*dmin^4)/64; %valore del momento di inerzia polare agente
theta_torsione = (mt/(G*Jo)) %valore dell'angolo di torsione

if theta_torsione > 4.36e-6
    disp ("La verifica a torsione non ha esito positivo, il diametro che verifica la torsione sarà il seguente: ")
    d_torsione = ((32*mt)/(G*pi*4.36e-6))^(1/4)
else
    disp ("Il diametro trovato verifica la torsione")
end
end

