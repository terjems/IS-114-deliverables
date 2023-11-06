use context essentials2021
# I kodeeksempel 1 klarer ikke load-table å bestemme datatypen siden denne er vist som en tekst-string. Vi bruker derfor sanitize-funksjonen for å endre dette slik: 

include shared-gdrive("dcic-2021", "1wyQZj_L0qqV9Ekgr9au6RX2iqt2Ga8Ep")                         # Oppgave 2.b) Inkluderte her dcic2021 slik oppgaveteksten viser til

include gdrive-sheets
       include data-source
       ssid = "1RYN0i4Zx_UETVuYacgaGfnFcv4l9zd9toQTTdkQkj7g"
       kWh-wealthy-consumer-data =
             load-table: komponent, energi
             source: load-spreadsheet(ssid).sheet-by-name("kWh", true)
    sanitize energi using string-sanitizer
# Oppgave 2.a) Lagt til sanitize-funksjonen for å endre kolonnen "energi" til strings.
  end


energy-per-unit-of-fuel = 10
# 10 kWh per liter drivstoff

distance-per-unit-of-fuel = 20
# 20 KM per liter drivstoff (Tall hentet fra https://vianor.no/dekkinformasjon/fakta-om-dekk/drivstofforbruk/, gjennomsnitt fra 2022)

distance-travelled-per-day = 30
# 30 KM per dag er gjennomsnittlig bilbruk i Norge, tall fra https://www.ssb.no/transport-og-reiseliv/landtransport/statistikk/kjorelengder for år 2022)

energy-per-day = ( distance-travelled-per-day / 
                            distance-per-unit-of-fuel ) * 
                                        energy-per-unit-of-fuel
# Oppgave 2.e) Har her brukt formelen for energiforbruk for bil slik vist i kompendiet og hva vi gikk gjennom i timen. Deretter endret jeg i funksjonen under hvor jeg endret | none => 0 --> | none => energy-per-day. Dette vises da i tabellen og gir energiforbruket for bil som 15 kWh. Deretter fjernet jeg en linje under linje 38 hvor det tidligere sto energi-to-number("") is 0. Dette gjør også at verdien for bil endres fra 0 til 15 og i tilegg endrer summen fra 155 til 170.


fun energi-to-number(str :: String) -> Number:
  cases(Option) string-to-number(str):
# Oppgave 2.b) Lagt inn cases-funksjonen for å endre strings til numbers. 
    | some(a) => a
    | none => energy-per-day
  end
where:
  energi-to-number("48") is 48
end


kWh-wealthy-consumer-data-numbers = transform-column(kWh-wealthy-consumer-data, "energi" , energi-to-number)
# Oppgave 2.c) Har her definert en ny tabell som viser korrekt consumer-data som numbers i stede for strings.

sum(kWh-wealthy-consumer-data-numbers, "energi")
# Oppgave 2.d) Har her brukt sum-funksjonen for å summere hele energiforbruket til en "typisk" innbygger i et industriland



bar-chart(kWh-wealthy-consumer-data-numbers, "komponent", "energi")    
# Oppgave 2.e) Lagt inn bar-chart som viser tabellen grafisk med x og y-akser.

