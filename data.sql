/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '2020-02-03', 0, '1', 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '2018-11-15', 2, '1', 8.0);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '2021-01-07', 1, '0', 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '2017-05-12', 5, '1', 11.0);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', '2020-02-08', 0, '0', -11.0);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', '2021-11-15', 2, '1', -5.7);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', '1993-04-02', 3, '0', -12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', '2005-06-12', 1, '1', -45.0);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', '2005-06-07', 7, '1', 20.4);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', '1998-10-13', 3, '1', 17.0);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto', '2022-05-14', 4, '1', 22.0);

INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34), ('Jennifer Orwell', 19), ('Bob', 45), ('Melody Pond', 77), ('Dean Winchester', 14), ('Jodie Whittaker', 38);
INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';

UPDATE animals SET owners_id = 1 WHERE name LIKE '%Agumon';
UPDATE animals SET owners_id = 2 WHERE name LIKE '%Gabumon' AND name LIKE '%Pikachu';
UPDATE animals SET owners_id = 3 WHERE name LIKE '%Devimon' OR name LIKE '%Plantmon';
UPDATE animals SET owners_id = 4 WHERE name LIKE '%Charmander' OR name LIKE '%Squirtle' OR name LIKE '%Blossom';
UPDATE animals SET owners_id = 5 WHERE name LIKE '%Angemon' OR name LIKE '%Boarmon';


-- Vet clinic database: add "join table" for visits 
INSERT INTO vets (name, age, date_of_graduation) VALUES
('William Tatcher', 45, DATE '2000-04-23'),
('Maisy Smith', 26, DATE '2019-01-17'),
('Stephanie Mendez', 64, DATE '1981-05-04'),
('Jack Harkness', 38, DATE '2008-06-08');

INSERT INTO specializations(vet_id, species_id) VALUES
(1,1),
(3,2),
(3,1),
(4,2);

INSERT INTO visits(animal_id, vet_id, visit_dates)
VALUES
(1,1, DATE '2020-05-24'),
(1,3, DATE '2020-07-22'),
(2,4, DATE '2021-02-02'),
(3,2, DATE '2020-01-05'),
(3,2, DATE '05-14-2020'),
(3,2, DATE '03-08-2020'),
(4,3, DATE '05-04-2021'),
(5,4, DATE '02-24-2021'),
(6,2, DATE '12-21-2019'),
(6,1, DATE '08-10-2020'),
(6,2, DATE '04-07-2021'),
(7,3, DATE '09-29-2019'),
(8,4, DATE '10-03-2020'),
(8,4, DATE '11-04-2020'),
(9,2, DATE '01-24-2019'),
(9,2, DATE '05-15-2019'),
(9,2, DATE '02-27-2020'),
(9,2, DATE '08-03-2020'),
(10,3, DATE '05-24-2020'),
(10,1, DATE '01-11-2021');


