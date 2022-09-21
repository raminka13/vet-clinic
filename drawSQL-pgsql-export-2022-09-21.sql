CREATE TABLE "animals"(
    "id" INTEGER NULL,
    "name" VARCHAR(255) NULL,
    "date_of_birth" DATE NULL,
    "escape_attempts" INTEGER NULL,
    "neutered" BOOLEAN NOT NULL,
    "weight_kg" DECIMAL(8, 2) NULL,
    "species_id" INTEGER NOT NULL,
    "owners_id" INTEGER NOT NULL
);
ALTER TABLE
    "animals" ADD PRIMARY KEY("id");
CREATE TABLE "owners"(
    "id" INTEGER NULL,
    "full_name" VARCHAR(255) NULL,
    "age" INTEGER NULL,
    "email" VARCHAR(255) NOT NULL
);
CREATE INDEX "owners_email_index" ON
    "owners"("email");
ALTER TABLE
    "owners" ADD PRIMARY KEY("id");
CREATE TABLE "species"(
    "id" INTEGER NULL,
    "name" VARCHAR(255) NULL
);
ALTER TABLE
    "species" ADD PRIMARY KEY("id");
CREATE TABLE "vets"(
    "id" INTEGER NULL,
    "name" VARCHAR(255) NULL,
    "age" INTEGER NULL,
    "date_of_graduation" DATE NULL
);
ALTER TABLE
    "vets" ADD PRIMARY KEY("id");
CREATE TABLE "specializations"(
    "id" INTEGER NULL,
    "vet_id" INTEGER NULL,
    "specie_id" INTEGER NULL
);
ALTER TABLE
    "specializations" ADD PRIMARY KEY("id");
CREATE TABLE "visits"(
    "id" INTEGER NULL,
    "animal_id" INTEGER NOT NULL,
    "vet_id" INTEGER NOT NULL,
    "date_of_visit" DATE NOT NULL
);
CREATE INDEX "visits_animal_id_vet_id_index" ON
    "visits"("animal_id", "vet_id");
ALTER TABLE
    "visits" ADD PRIMARY KEY("id");
CREATE INDEX "visits_animal_id_index" ON
    "visits"("animal_id");
CREATE INDEX "visits_vet_id_index" ON
    "visits"("vet_id");
ALTER TABLE
    "animals" ADD CONSTRAINT "animals_species_id_foreign" FOREIGN KEY("species_id") REFERENCES "species"("id");
ALTER TABLE
    "animals" ADD CONSTRAINT "animals_owners_id_foreign" FOREIGN KEY("owners_id") REFERENCES "owners"("id");
ALTER TABLE
    "specializations" ADD CONSTRAINT "specializations_vet_id_foreign" FOREIGN KEY("vet_id") REFERENCES "vets"("id");
ALTER TABLE
    "specializations" ADD CONSTRAINT "specializations_specie_id_foreign" FOREIGN KEY("specie_id") REFERENCES "species"("id");
ALTER TABLE
    "visits" ADD CONSTRAINT "visits_animal_id_foreign" FOREIGN KEY("animal_id") REFERENCES "animals"("id");
ALTER TABLE
    "visits" ADD CONSTRAINT "visits_vet_id_foreign" FOREIGN KEY("vet_id") REFERENCES "vets"("id");