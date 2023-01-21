/* Database schema to keep the structure of entire database. */

CREATE TABLE animals( 
    id              INT GENERATED ALWAYS AS IDENTITY, 
    name            VARCHAR(250), 
    date_of_birth   DATE,
    escape_attempts INT, 
    neutered        BIT(1), 
    weight_kg       DECIMAL, 
    PRIMARY KEY(id)
 );

ALTER TABLE animals 
ADD COLUMN species VARCHAR(50);

 CREATE TABLE owners (
    id SERIAL PRIMARY KEY, 
    full_name VARCHAR, 
    age INT
);

 CREATE TABLE species (
    id SERIAL PRIMARY KEY, 
    name VARCHAR
);

ALTER TABLE animals 
DROP COLUMN id;
ALTER TABLE animals 
ADD COLUMN id SERIAL PRIMARY KEY;
ALTER TABLE animals 
DROP COLUMN species;

ALTER TABLE animals 
ADD COLUMN species_id INT; 
ALTER TABLE animals 
ADD CONSTRAINT fk_species_id 
FOREIGN KEY(species_id) 
REFERENCES species(id) 
ON DELETE CASCADE;

ALTER TABLE animals 
ADD COLUMN owners_id INT;

ALTER TABLE animals ADD CONSTRAINT fk_owners_id FOREIGN KEY(owners_id) REFERENCES owners(id) ON DELETE CASCADE;


-- Vet clinic database: add "join table" for visits

CREATE TABLE vets (
    id SERIAL PRIMARY KEY, 
    name VARCHAR(255), 
    age INT, 
    date_of_graduation DATE
);


CREATE TABLE specializations (
    vet_id INT NOT NULL REFERENCES vets(id),
    species_id INT NOT NULL REFERENCES species(id),
    PRIMARY KEY(vet_id,species_id)
);


CREATE TABLE visits (
  animal_id INT NOT NULL,
  vet_id INT NOT NULL,
  visit_dates Date NOT NULL,
  CONSTRAINT primary_pk
  PRIMARY KEY (animal_id, vet_id, visit_dates),
  FOREIGN KEY (animal_id) REFERENCES animals (id),
  FOREIGN KEY (vet_id) REFERENCES vets (id)
);