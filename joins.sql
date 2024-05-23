-- Oppgaven skal gjøres i øvingsmiljøet (se [README.md](README.md) for installasjonsveiledning).

-- Oppgave 1: Likhet behøver ikke å være i form at en fremmednøkkel når man bruker en likekobling
-- Kolonnene som brukes i betingelsen trenger kun ha samme type
-- Hvorfor kan det være problematisk? Finn et relevant eksempel i databasen "hobbyhuset"
-- som viser problemet ved bruken av INNER JOIN (tips: se på Kunde.KNr og Poststed.PostNr).


-- Oppgave 2: Løse oppgaven fra forelesningen ved hjelp av NATURAL JOIN

-- Oppgave 3: Hva kan man konkludere fra resultater av disse spørringene? 
SELECT * FROM Vare NATURAL LEFT JOIN Kategori;
SELECT * FROM Vare LEFT JOIN Kategori ON Vare.KatNr = Kategori.KatNr;
-- Hva blir forskjellen, hvis man erstatter LEFT JOIN med INNER JOIN?


-- Oppgave 4: Hva kan man konkludere fra resultater av disse spørringene? 
SELECT * FROM Vare NATURAL RIGHT JOIN Kategori;
SELECT * FROM Vare RIGHT JOIN Kategori ON Vare.KatNr = Kategori.KatNr;
-- Hva blir forskjellen, hvis man erstatter RIGHT JOIN med INNER JOIN?


-- Oppgave 5: Bevis at spørringene gir lik resultat (tips: bruk EXPLAIN). 
SELECT * from Vare, Kategori;
SELECT * FROM Vare CROSS JOIN Kategori;

-- Oppgave 6: Lag en spørring ved bruk av NATURAL JOIN, som returnerer det samme 
-- resultatet som denne spørringen:
SELECT Fornavn, Etternavn from Kunde, Ordre WHERE Kunde.KNr = Ordre.KNr;

-- Oppgave 7: Hva kalles resultatet av en slik spørring? Hvor mange rader vil følgende spørring returnere? 
-- Denne spørringen krever mye maskinvareressurser, så prøv å finne ut hvor mange rader har hver tabell og så
-- regn ut resultatet uten å utføre spørringen direkte.
SELECT * from Kunde, Ordre, Ordrelinje;