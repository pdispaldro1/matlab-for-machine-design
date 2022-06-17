function verifica_max_deflessione = deflessionemassima(~)

alfa_max = input("Inserisci il massimo valore di alfa: "); %valore massimo di alfa che si ricava dalla deformata
freccia_max_xy = input("Inserisci il valore massimo della freccia sul piano xy: "); %valore massimo della freccia sul piano xy
freccia_max_xz = input("Inserisci il valore massimo della freccia sul piano xz: "); %valore massimo della freccia sul piano yz
l = input("Inserisci la lunghezza dell'albero: "); %lunghezza dell'albero che ricavo dal disegno originario in proporzione alla larghezza del dente della ruota

j1=tan(alfa_max) %angolo di deflessione j1

if tan(alfa_max) <= 1/1000
    disp ("Questa prima verifica ha esito positivo!")
else
    disp ("Questa prima verifica ha esito negativo!")
end

freccia_max = sqrt(freccia_max_xy^2+freccia_max_xz^2) %valore della freccia massima prendendo come componenti le frecce sul piano xy e yz
rapporto_freccia_l = freccia_max/l %rapporto tra la freccia massima trovata e la lunghezza dell'albero

if (rapporto_freccia_l) < (1/3000)
    disp ("L'albero è verificato in via definitiva a deflessione massima!")
else
    disp ("L'albero non è verificato in questo secondo caso!")
end
end


