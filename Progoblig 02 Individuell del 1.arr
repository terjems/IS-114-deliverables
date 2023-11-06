use context essentials2021
include color # Lagt til denne for å få inn korrekte fargekoder for flaggene.

# For å tegne flagg, skriv inn navn på land i interaksjonsfeltet. Valgene du har er: Norge, Finland, Island, Faeroyene, Danmark og Sverige.

fun
  draw-flag(land):
  
  fun paint-backgroundcolor():
    if
        land == "Norge": color(186, 12, 47, 1)
    else if land == "Finland": color(255, 255, 255, 1)
    else if land == "Island": color(2, 82, 156, 1)
    else if land == "Faeroyene": color(255, 255, 255, 1)
    else if land == "Danmark": color(200, 16, 46, 1)
    else if land == "Sverige": color(0, 106, 167, 1)
  end
  end
  
  fun paint-innercrosscolor():
    if 
      land == "Norge": color(0, 32, 91, 1)
    else if land == "Finland": color(0, 47, 108, 1)
    else if land == "Island": color(220, 30, 53, 1)
    else if land == "Faeroyene": color(237, 41, 57, 1)
    else if land == "Danmark": color(255, 255, 255, 1)
    else if land == "Sverige": color(254, 204, 2, 1)
    end
  end
  
  fun paint-outercrosscolor():
    if
      land == "Norge": color(255, 255, 255, 1)
    else if land == "Finland": color(0, 47, 108, 1)
    else if land == "Island": color(255, 255, 255, 1)
    else if land == "Faeroyene": color(0, 101, 189, 1)
    else if land == "Danmark": color(255, 255, 255, 1)
    else if land == "Sverige": color(254, 204, 2, 1)
    end
  end
  
  fun find-height():
    if land == "Norge": 160               # Ganget proposjoner med 10x.
    else if land == "Finland": 220        # Ganget proposjoner med 20x.
    else if land == "Island": 180         # Ganget proposjoner med 10x.
    else if land == "Faeroyene": 160      # Ganget proposjoner med 10x.
    else if land == "Danmark": 280        # Ganget proposjoner med 20x.
    else if land == "Sverige": 200        # Ganget proposjoner med 20x.
    end
  end
  
  fun find-width():
    if land == "Norge": 220               # Ganget proposjoner med 10x.
    else if land == "Finland": 360        # Ganget proposjoner med 10x.
    else if land == "Island": 250         # Ganget proposjoner med 10x.
    else if land == "Faeroyene": 220      # Ganget proposjoner med 10x.
    else if land == "Danmark": 370        # Ganget proposjoner med 10x.
    else if land == "Sverige": 320        # Ganget proposjoner med 10x.
    end
  end
  
  fun findinnercrosswidth():
    if land == "Norge": 20                # Disse verdiene er hentet fra fotw.info som er en nettside som gir proposjonene på flagg. Deretter er disse verdiene ganget slik vist over.
    else if land == "Finland": 60    
    else if land == "Island": 20
    else if land == "Faeroyene": 20
    else if land == "Danmark": 40
    else if land == "Sverige": 40
    end
  end
  
  fun find-cross-position():
    if land == "Norge": 75 + (findinnercrosswidth() / 2)
    else if land == "Finland": 110 + (findinnercrosswidth() / 2)
    else if land == "Island": 85 + (findinnercrosswidth() / 2)
    else if land == "Faeroyene": 75 + (findinnercrosswidth() / 2)
    else if land == "Danmark": 125 + (findinnercrosswidth() / 2)
    else if land == "Sverige": 110 + (findinnercrosswidth() / 2)
    end
  end
  
  
  backgroundcolor = paint-backgroundcolor()
  innercrosscolor = paint-innercrosscolor()
  outercrosscolor = paint-outercrosscolor()
  
  width = find-width()
  height = find-height()
  
  background = rectangle(width, height, "solid", backgroundcolor)
  
  outerhorizontalrectangle = rectangle(width, 40, "solid", outercrosscolor)
  innerhorizontalrectangle = rectangle(width, findinnercrosswidth(), "solid", innercrosscolor)
  innerverticalrectangle = rectangle(findinnercrosswidth(), height, "solid", innercrosscolor)
  outerverticalrectangle = rectangle(40, height, "solid", outercrosscolor)
  
  
  put-image(innerhorizontalrectangle, width / 2, height / 2, 
    put-image(innerverticalrectangle, find-cross-position(), height / 2,
       put-image(outerhorizontalrectangle, width / 2, height / 2,
        put-image(outerverticalrectangle, find-cross-position(), height / 2,
          background))))
    end




Norge = draw-flag("Norge")
Finland = draw-flag("Finland")
Island = draw-flag("Island")
Faeroyene = draw-flag("Faeroyene")
Danmark = draw-flag("Danmark")
Sverige = draw-flag("Sverige")