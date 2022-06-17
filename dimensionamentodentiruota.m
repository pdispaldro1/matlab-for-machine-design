function calcolodentiruote = dimensionamentodentiruota(~)

disp("Questo tool permette di calcolare il numero di denti della ruota accoppiata utilizzando come ruota primaria una ruota con 17 denti.")

z1 = input ("Inserisci il numero di denti della ruota primaria: "); %questo è il numero di denti della ruota primaria, di solito pari a 17
tau = input ("Inserisci il valore di tau dell'accoppiamento: "); %questo è il valore di tau ricavato

z2 = ceil(z1/tau); %questo è il valore dei denti della seconda ruota arrotondato all'intero superiore

i1 = "Z ruota primaria";
i2 = "Z ruota secondaria";

indici = [i1;i2]; %vettore contenente gli indici
valori_z = [z1;z2]; %vettore contenente i valori del numero di denti delle ruote ma senza indici
calcolodentiruote = [indici, valori_z]; %vettore completo di indici e del valore delle ruote

end