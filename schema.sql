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