-- Kommandoer relatert til databaseskjema (metadata).
-- Kommandoene er MariaDB spesifikke.

SHOW DATABASES; -- viser alle databaser i database-applikasjonen
SELECT DATABASE(); -- den gjeldende database i mysql klient-applikasjonen
SELECT TABLE_NAME, COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_TABLE_NAME, REFERENCED_COLUMN_NAME 
	FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE 
	WHERE REFERENCED_TABLE_SCHEMA = 'hobbyhuset' AND REFERENCED_TABLE_NAME = 'Vare';

SHOW TABLES; -- alle tabeller i den gjeldende databasen

DESC <tabell_navn>; -- de viktigste metadataene for tabell <tabell_navn>; DESC er forkortelse for DESCRIBE
