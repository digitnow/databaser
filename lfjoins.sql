

-- Oppgave 1 løsningsforslag
-- Logikken databaseskjemaet gjelder ikke (kan sammenligne "epler" med "pærer")
-- Eksempel:
SELECT * from Kunde INNER JOIN Poststed ON Kunde.KNr = Poststed.PostNr limit 20;

-- Oppgave 2 løsningsforslag
-- Løsningsforslag
SELECT Fornavn, Etternavn, sum(PrisPrEnhet*Antall) AS Beløp 
	FROM Kunde 
	NATURAL JOIN Ordre 
	NATURAL JOIN OrdreLinje 
	GROUP BY KNr 
	ORDER BY Beløp DESC 
	LIMIT 20;

-- Oppgave 3 løsningsforslag
-- At en vare ikke hører til noen kategori, dvs. varer som 
-- ikke tilhører en kategori blir også listet. 
-- Varer som ikke tilhører en kategori, blir ikke vist i resultatet.

-- Oppgave 4 løsningsforslag
-- At det ikke er registret varer for 4 kategorier.
-- Ved bruk av INNER JOIN, blir ikke kategorier, som ikke har varer, vist.

-- Oppgave 5 løsningsforslag
EXPLAIN (SELECT * from Vare, Kategori);
EXPLAIN (SELECT * FROM Vare CROSS JOIN Kategori);