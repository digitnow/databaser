-- Oppgave fra forelesningen 2024-05-23
-- Oppgave : Finn 10 kunder, som har handlet for størst samlet beløp hos Hobbyhuset
-- Krever koblinger mellom 3 tabeller.

SELECT Kunde.Fornavn, Kunde.Etternavn, Ordre.OrdreNr, Ordre.OrdreDato  
 	FROM Kunde 
 	INNER JOIN Ordre ON Kunde.KNr = Ordre.KNr 
 	LIMIT 20;


SELECT Kunde.Fornavn, Kunde.Etternavn,
Ordre.OrdreNr, Ordre.OrdreDato, 
OrdreLinje.VNr, OrdreLinje.PrisPrEnhet, OrdreLinje.Antall  
 	FROM Kunde 
 	INNER JOIN Ordre ON Kunde.KNr = Ordre.KNr 
 	INNER JOIN OrdreLinje ON Ordre.OrdreNr = OrdreLinje.OrdreNr
 	LIMIT 20;


SELECT K.Fornavn, K.Etternavn, 
O.OrdreNr, O.OrdreDato, 
OL.VNr, OL.PrisPrEnhet, OL.Antall  
	FROM Kunde K 
	INNER JOIN Ordre O ON K.KNr = O.KNr 
	INNER JOIN OrdreLinje OL ON O.OrdreNr = OL.OrdreNr 
	GROUP BY K.KNr 
	LIMIT 20;

SELECT K.Fornavn, K.Etternavn, 
sum(OL.PrisPrEnhet*OL.Antall) AS Beløp
	FROM Kunde K 
	INNER JOIN Ordre O ON K.KNr = O.KNr 
	INNER JOIN OrdreLinje OL ON O.OrdreNr = OL.OrdreNr 
	GROUP BY K.KNr 
	LIMIT 20;

SELECT K.KNr, K.Fornavn, K.Etternavn, 
sum(OL.PrisPrEnhet*OL.Antall) AS Beløp
	FROM Kunde K 
	INNER JOIN Ordre O ON K.KNr = O.KNr 
	INNER JOIN OrdreLinje OL ON O.OrdreNr = OL.OrdreNr 
	GROUP BY K.KNr 
	ORDER BY Beløp DESC
	LIMIT 10;

-- test for beløpet
SELECT * FROM Ordre, OrdreLinje where KNr = 5456 and ordre.OrdreNr = OrdreLinje.OrdreNr; 
SELECT * FROM Ordre INNER JOIN Ordrelinje ON ordre.OrdreNr = OrdreLinje.OrdreNr where KNr = 5456;
SELECT sum(PrisPrEnhet*Antall) 
	FROM Ordre O
	INNER JOIN OrdreLinje OL ON O.OrdreNr = OL.OrdreNr 
	WHERE KNr = 5456;