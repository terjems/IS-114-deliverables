use context essentials2021
# Jeg starter med å sette inn en outline i svart for å sette dimensjonene til flagget. Ved å gjøre dette først, vil alle de neste uttrykkene legge seg under denne og den vil være synlig som en definert kant på flagget.

# Deretter definerer jeg de ulike rektanglene jeg trenger for å designe flagget. Siden Det Norske Flaggets dimensjoner er 22:16, tar jeg utgangspunkt i det og ganger det tallet med 10 for å få en fin modell. Ut i fra disse dimensjonene, lager jeg deretter de blå og hvite rektanglene jeg trenger for å designe flagget. 

# Jeg angir dimensjonene for de blå linjene. I følge dimensjoner funnet på https://en.wikipedia.org/wiki/Flag_of_Norway, skal de blå linjene ha en bredde på 20, ut i fra min oppskalering. 

# For vertikal linje må jeg da altså angi høyde, (som blir flaggets fulle høyde) altså 160 og lendge 20. For horisontal blå linje, må jeg angi lendge, 220, og høyde 20. 

# Deretter angir jeg de hvite linjene. For å gjøre det letter for meg selv, har jeg valgt å bruke rekangler her også, siden jeg kan bruke put-image og bruke det til å overlaye de ulike objektene over hverandre. Dermed trenger jeg en hvit rektangel som er dobbelt så lang/høy som de blå linjene er, siden dimensjonene skal være 10. 

# Akkurat likt som de blå rektanglene, definerer jeg hvilke dimensjoner de hvite skal ha, slik vist under. Siden den blå linjen vil overlaye den hvite, trenger jeg at hvit er dobbelt så lang/høy som den blå slik at den er halvparten så tykk ved ferdigstilling av uttrykket.

# Deretter bruker jeg put-image-funksjonen til å plassere mine definisjoner. Jeg startet med å skrive inn tilfeldige tall og skrev ferdig hele uttrykket. Til å begynne var det bare en rød bakgrunn med fire rektangler sjonglert tilfeldigvis rundt på bildet. Etter litt testing og frem og tilbake fant jeg korrekte koordinater for de ulike elementene, og dermed var flagget ferdigstilt. 


blackoutline = rectangle(220, 160, "outline", "black")
redbackground = rectangle(220, 160, "solid", "crimson")
blueline1 = rectangle(220, 20, "solid", "midnight-blue")
blueline2 = rectangle(20, 160, "solid", "midnight-blue")
whiteline1 = rectangle(40, 160, "solid", "white")
whiteline2 = rectangle(220, 40, "solid", "white")


Norge =
  
  put-image(blackoutline, 110, 80, 
    put-image(blueline1, 110, 80, 
    put-image(blueline2, 85, 80, 
      put-image(whiteline1, 85, 80, 
        put-image(whiteline2, 110, 80, redbackground)))))