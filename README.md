# Databaser (materialer for prøveforelesning)

## SQL-fil
Inneholder efinisjoner og testdata for databasen "hobbyhuset" fra (Kristoffersen, 2020).

Kan lastes ned fra 

## Oppsett av testmiljøet
	$ docker run --name trial-mariadb -v /Users/janisg/oslomet/mariadb/datadir:/var/lib/mysql:Z -e MARIADB_ROOT_PASSWORD=Secret001 -d mariadb:latest

	$ docker run --name trial-mariadb -v /Users/…:datadir:/var/lib/mysql:Z -e MARIADB_ROOT_PASSWORD=… -d mariadb:latest

	$ docker exec -it trial-mariadb bash

	// i kontainer
	# apt-get update
	# apt-get install -y mysql-client
	# mysql --help
	mysql  Ver 8.0.36-0ubuntu0.22.04.1 for Linux on aarch64 ((Ubuntu))
	Copyright (c) 2000, 2024, Oracle and/or its affiliates.

	\# mysql --user=root --password
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

	mysql> SELECT DATABASE();
	mysql> SHOW TABLES;
	mysql> SHOW FIELDS FROM COLUMNS;
	mysql> explain (SELECT …)

	mysql> CREATE DATABASE hobbyhuset;
	mysql> USE hobbyhuset;
	— «source» kommandoen forutsetter at filen hobbyhuset.sql er lagret 
	— lokalt i en mappe som Docker har tilgang til 
	— (se kommandoen «docker run»)
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


