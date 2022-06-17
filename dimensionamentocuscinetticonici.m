function cuscinetticonici = dimensionamentocuscinetticonici(~)

disp("Questo tool permette di dimensionare i cuscinetti conici")

l10h = input ("Inserisci il valore previsto di ore: "); %valore previsto di ore del cuscinetto
n = input ("Inserisci il numero di giri dell'albero: "); %valore del numero di giri a cui ruota l'albero
fa = input ("Inserisci il valore della forza assiale agente sull'albero: "); %valore della forza assiale agente sull'albero
vxy1 = input ("Inserisci il valore della reazione vxy agente sul piano xy del primo cuscinetto: "); %valore della reazione vxy agente sul piano xy del primo cuscinetto
vyz1 = input ("Inserisci il valore della reazione vyz agente sul piano yz del primo cuscinetto: ");%valore della reazione vxy agente sul piano yz del primo cuscinetto
vxy2 = input ("Inserisci il valore della reazione vxy agente sul piano xy del secondo cuscinetto: "); %valore della reazione vxy agente sul piano xy del secondo cuscinetto
vyz2 = input ("Inserisci il valore della reazione vyz agente sul piano yz del secondo cuscinetto: ");%valore della reazione vxy agente sul piano yz del secondo cuscinetto

fr1 = sqrt((vxy1^2)+(vyz1^2)) %valore della forza radiale agente sul cuscinetto 1
fr2 = sqrt((vxy2^2)+(vyz2^2)) %valore della forza radiale agente sul cuscinetto 2

reazioni = [fr1;fr2] %vettore coi valori delle forze radiali agenti sui cuscinetti
disp ("Il vettore ha restituito in maniera ordinata i valori delle forze radiali agenti sui cuscinetti")

p_cuscinetto = 10/3 %si usa 10/3 in quanto gli elementi volventi sono dei cilindri

p_primo_tentativo1 = fr1;
C_primo_tentativo1 = ((l10h*(p_primo_tentativo1^p_cuscinetto)*60*n)/1000000)^(1/p_cuscinetto); %coefficiente di carico dinamico equivalente c1
p_primo_tentativo2 = fr2;
C_primo_tentativo2 = ((l10h*(p_primo_tentativo2^p_cuscinetto)*60*n)/1000000)^(1/p_cuscinetto); %coefficiente di carico dinamico equivalente c2

valori_C = [C_primo_tentativo1; C_primo_tentativo2] %vettore coi valori dei coefficienti di carico dinamico di primo tentativo

disp ("Il vettore ha restituito in maniera ordinata i valori del coefficiente di carico dinamico equivalente")

e1 = input ("Inserisci il valore del coefficiente di eccentricità ricavato dalla tabella del cuscinetto 1: "); %valore del coefficiente di eccentricità ricavato dalla tabella del primo cuscinetto
e2 = input ("Inserisci il valore del coefficiente di eccentricità ricavato dalla tabella del cuscinetto 2: "); %valore del coefficiente di eccentricità ricavato dalla tabella del secondo cuscinetto
y1 = input ("Inserisci il valore del coefficiente y ricavato dalla tabella del cuscinetto 1: "); %valore del coefficiente y ricavato dalla tabella del primo cuscinetto
y2 = input ("Inserisci il valore del coefficiente y ricavato dalla tabella del cuscinetto 2: "); %valore del coefficiente y ricavato dalla tabella del secondo cuscinetto

j =  0.5*((fr1/y1)-(fr2/y2)); %valore della sollecitazione assiale agente sull'albero

if j >= 0
    fa2 = 0.5*fr2/y2;
    fa1 = fa2 + fa;
else
    fa1 = 0.5*fr1/y1;
    fa2 = fa1 + fa;
end

valori_fa = [fa1;fa2] %vettore coi valori delle sollecitazioni assiali agenti sui due cuscinetti
disp ("Il vettore restituisce in maniera ordinata i valori delle sollecitazioni assiali agenti sul primo e secondo cuscinetto")

if fa1/fr1 < e1
    disp("Il cuscinetto 1 è verificato con x=1 e y=0!")
else
    disp ("Ripeti la procedura di dimensionamento utilizzando x e y pari al valore del cuscinetto trovato")
    x1 = input ("Inserisci il valore di x tabellato: ");
    y1 = input ("Inserisci il valore di y tabellato: ");
    c_tabella1 = ("Inserisci il valore limite di C da tabella: ");
    p1 = x1*fr1 + y1*fa;
    c1 = ((l10h*(p1^p_cuscinetto)*60*n)/1000000)^(1/p_cuscinetto)
    if c1 < c_tabella1
        disp ("Il cuscientto è verificato coi valori di x e y tabellati!")
    else 
        disp ("Resetta la funzione e ripeti la procedura da zero")
    end
end

if fa2/fr2 < e2
    disp ("Il cuscinetto 2 è verificato con x=1 e y=0!")
else
    disp ("Ripeti la procedura di dimensionamento del secondo cuscinetto utilizzando x e y pari al valore del cuscinetto trovato")
    x2 = input ("Inserisci il valore di x tabellato: ");
    y2 = input ("Inserisci il valore di y tabellato: ");
    c_tabella2 = input ("Inserisci il valore limite di C da tabella: ");
    p2 = x2*fr2 + y2*fa;
    c2 = ((l10h*(p2^p_cuscinetto)*60*n)/1000000)^(1/p_cuscinetto)
    if c2 < c_tabella2
        disp ("Il cuscinetto è verificato coi valori di x e y tabellati!")
    else
        disp ("Resetta la funzione e ripeti la procedura da zero")
    end
end
end



