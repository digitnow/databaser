-- Oppgave: selekter kun unike navn fra tabellen Kunde
SELECT DISTINCT Fornavn FROM Kunde;

-- Oppgave: selekter unike varenummer fra OrdreLinje
SELECT DISTINCT VNr FROM OrdreLinje;

-- Oppgave: finn ut hva blir prisene på alle varene med 10% rabatt
SELECT VNr, Betegnelse, Pris, Pris-Pris*0.1 AS rabattert_pris FROM Vare

-- Oppgave: legg til betingelse for å selektere vare med betegnelse som inneholder ordet "farge"
SELECT VNr, Betegnelse, Pris, Pris-Pris*0.1 AS rabattert_pris FROM Vare WHERE Betegnelse LIKE "%farge%";

-- Oppgave: finn ut hvor mange varer finnes det i tabellen Vare (er de unike? bevis);
SELECT DISTINCT count(*) FROM Vare;
SELECT count(*) FROM Vare;

-- Oppgave: finn ut hvor mange unike varer er det blitt bestillt av kundene

-- Oppgave: selekter alle varer, som har pris under 100
SELECT * FROM Vare WHERE Pris < 100 AND Antall <> 0;

-- Oppgave: selekter all prishistorikk for varen "Nisseskjegg, 30 cm"
SELECT * FROM Prishistorikk WHERE VNr = (SELECT VNr FROM Vare WHERE Betegnelse LIKE 'Nisseskjegg, 30 cm') ORDER BY Dato DESC;

-- Oppgave: lage en spørring som returnerer en tabell med to kolonner, - "Tabellnavn" og "Antall rader" 
-- med korrekte verdier for tabellene Vare og Kunde
(SELECT 'Vare' AS 'Tabellnavn', count(*) AS 'Antall rader' FROM Vare) 
UNION 
(SELECT 'Kunde' AS 'Tabellnavn', count(*) AS 'Antall rader' FROM Kunde);

-- Oppgave: hva returnerer denne spørringen?
SELECT AnsNr FROM Ansatt GROUP BY PostNr; 

-- Oppgave: finn ut hvor mange ansatte bor på samme postnummer området og vis kun rader som har postnummer mellom 
-- 3800 og 3812
SELECT PostNr, count(*) from ANSATT GROUP BY PostNr HAVING PostNR BETWEEN 3800 AND 3812;

-- Oppgave (kryssprodukt) Begrunn resultatet som denne spørringene returnerer 
SELECT count(*) FROM Kunde, Ansatt;
SELECT (SELECT count(*) FROM Kunde) * (SELECT count(*) FROM Ansatt);