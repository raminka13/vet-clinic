/* Database schema to keep the structure of entire database. */

CREATE TABLE animals ( 
    id INT GENERATED BY DEFAULT AS IDENTITY, 
    name VARCHAR(40) NOT NULL, 
    date_of_birth DATE NOT NULL, 
    escape_attempts INT NOT NULL, 
    neutered BOOLEAN, 
    weight_kg DECIMAL NOT NULL );

ALTER TABLE animals
ADD COLUMN species VARCHAR(50);

CREATE TABLE owners (
    id INT GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
    full_name VARCHAR(60) NOT NULL,
    age INT NOT NULL
);

CREATE TABLE species (
    id INT GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
    name VARCHAR(60) NOT NULL
);

ALTER TABLE animals
ADD PRIMARY KEY(id);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals 
ADD species_id INT,
ADD FOREIGN KEY (species_id) REFERENCES species(id);

ALTER TABLE animals 
ADD owner_id INT,
ADD FOREIGN KEY (owner_id) REFERENCES owners(id);

CREATE TABLE vets (
    id INT GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    age INT NOT NULL,
    date_of_graduation DATE NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE specializations (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    vet_id INT NOT NULL,
    specie_id INT NOT NULL,
    CONSTRAINT fk_vets FOREIGN KEY (vet_id) REFERENCES vets(id),
    CONSTRAINT fk_species FOREIGN KEY (specie_id) REFERENCES species(id)
);

CREATE TABLE visits (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    animal_id INT NOT NULL,
    vet_id INT NOT NULL,
    date_of_visit DATE NOT NULL,
    CONSTRAINT fk_animals FOREIGN KEY (animal_id) REFERENCES animals(id),
    CONSTRAINT fk_vets FOREIGN KEY (vet_id) REFERENCES vets(id)
);

CREATE INDEX animal_index ON visits (animal_id);
CREATE INDEX vet_index ON visits (vet_id);
