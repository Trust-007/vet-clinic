/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth >= DATE '2016-01-01' AND date_of_birth <= DATE '2019-12-31';
SELECT name FROM animals WHERE neutered = '-1' AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;
SELECT * FROM animals;
BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > DATE '2022-01-01';
SAVEPOINT FIRST_SAVE;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO FIRST_SAVE;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE SIGN(weight_kg) < 0;
COMMIT;

SELECT COUNT(*) 
FROM animals;
SELECT COUNT(*) FROM animals 
WHERE escape_attempts = 0;
SELECT AVG(weight_kg) 
FROM animals;
SELECT neutered,SUM(escape_attempts) 
FROM animals 
GROUP BY(neutered);


SELECT neutered, COUNT(*) AS NumOfanimals, AVG(escape_attempts) AS Avgescape_attempts 
FROM animals 
GROUP BY neutered;

SELECT species, MIN(weight_kg), MAX(weight_kg) 
FROM animals 
GROUP BY species;

SELECT species, AVG(escape_attempts) 
FROM animals
WHERE date_of_birth BETWEEN DATE '1990-01-01' AND DATE '2000-12-31' 
GROUP BY species;

SELECT owners_id, name, owners.id, full_name 
FROM animals 
JOIN owners ON owners_id = owners.id 
WHERE owners.full_name LIKE '%Pond';

SELECT owners_id, name, owners.id, full_name 
FROM animals 
RIGHT JOIN owners ON owners_id = owners.id ;

SELECT species_id, animals.name, species.id, species.name 
FROM animals JOIN species ON species_id = species.id;

SELECT owners_id, animals.name, owners.id, full_name 
FROM animals JOIN owners ON owners_id = owners.id 
WHERE owners.full_name LIKE '%Orwell' AND species_id = 2;

SELECT owners_id, name, owners.id, full_name 
FROM animals JOIN owners ON owners_id = owners.id
 WHERE owners.full_name LIKE '%Dean' AND escape_attempts = 0;

SELECT owner 
FROM (SELECT COUNT(animals.name) as count, full_name as owner 
FROM animals 
JOIN owners ON owners_id = owners.id 
GROUP BY owner) AS animals_per_owner 
WHERE count = (SELECT MAX(count) 
FROM (SELECT COUNT(animals.name) as count, full_name as owner 
FROM animals 
JOIN owners ON owners_id = owners.id GROUP BY owner) AS animals_per_owner);

