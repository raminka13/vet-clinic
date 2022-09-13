/*Queries that provide answers to the questions from all projects.*/
SELECT name FROM animals WHERE name LIKE '%mon';

SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND  '2019-12-31';

SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name='Agumon' OR  name='Pikachu';

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = true;

SELECT * FROM animals WHERE name <> 'Gabumon';

SELECT * FROM animals WHERE weight_kg  >= 10.4 AND weight_kg <= 17.3;

-- TRANSACTION 1
BEGIN;

UPDATE animals
SET species = 'unspecified';

ROLLBACK;

-- TRANSACTION 2
BEGIN;
UPDATE animals
SET species = 'digimon' WHERE name LIKE '%mon';

UPDATE animals
SET species = 'pokemon' WHERE species IS NULL;

COMMIT;

-- TRANSACTION 3
BEGIN;

DELETE FROM animals;

ROLLBACK;

-- TRANSACTION 4
BEGIN;

DELETE FROM animals WHERE date_of_birth > '2022-01-01';

SAVEPOINT save1;

UPDATE animals SET weight_kg = weight_kg * -1;

ROLLBACK TO SAVEPOINT save1;

UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

COMMIT;


-- Queries day 2
SELECT COUNT(id) FROM animals;

SELECT COUNT(*) FROM animals WHERE escape_attempts=0;

SELECT AVG(weight_kg) AS weight_avg FROM animals;

SELECT neutered, SUM(escape_attempts) AS escapeattemps 
FROM animals 
GROUP BY neutered 
ORDER BY escapeattemps  DESC;

SELECT species, MAX(weight_kg) AS max_weight, MIN(weight_kg) AS min_weight 
FROM animals GROUP BY species;

SELECT species, AVG(escape_attempts) FROM animals 
WHERE date_of_birth BETWEEN '1990-01-01' AND '1999-12-31' 
GROUP BY species;