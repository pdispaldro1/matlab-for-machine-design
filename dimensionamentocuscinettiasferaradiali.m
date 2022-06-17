function cuscinettiasfera = dimensionamentocuscinettiasfera(~)

disp("Questo tool permette di calcolare i valori da cui parte la scelta dei cuscinetti a sfera")

l10h = input ("Inserisci il valore previsto di ore: "); %valore della durata prevista del cuscinetto in ore
n = input ("Inserisci il numero di giri a cui ruota l'albero: "); %valore del numero di giri a cui ruota l'albero
vxy= input ("Inserisci il valore della sommatoria delle reazioni vincolari agenti sul piano xy: "); %valore della sommatoria delle reazioni vincolari agenti sul piano xy
vyz= input ("Inserisci il valore della sommatoria delle reazioni vincolari agenti sul piano yz: "); %valore della sommatoria delle reazioni vincolari agenti sul piano yz

%Il cuscinetto a sfera non è sottoposto a carichi assiali

fr = sqrt((vxy^2)+(vyz^2)) %valore della sollecitazione radiale

p = fr; %carico dinamico equivalente
p_cuscinetto = 3; %si usa 3 in quanto gli elementi volventi sono sfere

c = ((l10h*(p^p_cuscinetto)*60*n)/1000000)^(1/p_cuscinetto) %coefficiente di carico del cuscinetto

end

