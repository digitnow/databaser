# Databaser (materialer for prøveforelesning)

## Diverse ressurser i denne repository-en
- [Spørringer fra prøveforelesning](oppgave.sql) 
- [Spørringer om databaseskjema](databaseskjema.sql)
- [SELECT eksempler](select-intro.sql)

## Laboppgaver
- [Laboppgaver om koblinger](joins.sql) ([Løsningsforslag](lfjoins.sql))

## SQL-fil for "hobbyhuset"
Inneholder definisjoner og testdata for databasen "hobbyhuset" fra (Kristoffersen, 2020).

Kan lastes ned fra websiden til boken "Databasesystemer" (Kristoffersen, 2020) [SQL-skript for Hobbyhuset](https://www.dbsys.info/Databasesystemer/1_Datasett/sqlskript.html).

## Oppsett av øvingsmiljøet

Forutsetter at [Docker](https://docs.docker.com/engine/install/) er installert på vertsmaskinen. 

	$ docker run --name trial-mariadb -p 3306:3306 -v <en_sti_lokalt>:/var/lib/mysql:Z -e MARIADB_ROOT_PASSWORD=<valgt_passord> -d mariadb:latest

	<en_sti_lokalt> er den mappen hvor man ønsker en kopi av mappen fra kontaineren /var/lib/mysql, som inneholder data og metadata for databasehåndteringssystemet (MariaDB i dette tilfeller)

	<valgt_passord> er et selvvalgt passord, som brukes senere når man skal bruke mysql-klienten på kommandolinje i kontaineren

	$ docker exec -it trial-mariadb bash

	// i kontainer
	# apt-get update
	# apt-get install -y mysql-client
	# mysql --help
	mysql  Ver 8.0.36-0ubuntu0.22.04.1 for Linux on aarch64 ((Ubuntu))
	Copyright (c) 2000, 2024, Oracle and/or its affiliates.

	# mysql --user=root --password
	mysql> SHOW DATABASES;
	+--------------------+
	| Database           |
	+--------------------+
	| information_schema |
	| mysql              |
	| performance_schema |
	| sys                |
	+--------------------+
	4 rows in set (0.01 sec)

	mysql> CREATE DATABASE hobbyhuset;
	mysql> USE hobbyhuset;

	— «source» kommandoen forutsetter at filen hobbyhuset.sql er lagret 
	— lokalt på vertsmaskinen i en mappe, som Docker har tilgang til 
	— (se kommandoen «docker run» og valget "-v")
	mysql> source /var/lib/mysql/hobbyhuset.sql 
	mysql> SHOW TABLES;
	+----------------------+
	| Tables_in_hobbyhuset |
	+----------------------+
	| Ansatt               |
	| Kategori             |
	| Kunde                |
	| Ordre                |
	| Ordrelinje           |
	| Poststed             |
	| Prishistorikk        |
	| Vare                 |
	+----------------------+
	8 rows in set (0.01 sec)

## Referanser
Kristoffersen B. (2020). Databasesystemer. Universitetsforlaget, 5. utgave, ISBN: 978-82-15-03251-1.


