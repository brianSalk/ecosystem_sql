CREATE TABLE IF NOT EXISTS organism (
	genus VARCHAR(40) NOT NULL,
	species VARCHAR(40) NOT NULL,
	kingdom VARCHAR(15),
	habitat VARCHAR(30),
	conservation_status VARCHAR(30) CHECK (conservation_status IN ('GX','GH','G5','G4','G3','G2','G1')),
	population INT,
	CONSTRAINT PK_Species PRIMARY KEY (genus, species)
);

CREATE TABLE IF NOT EXISTS foodchain (
	prey_genus VARCHAR(40),
	prey_species VARCHAR(40),
	preditor_genus VARCHAR(40),
	preditor_species VARCHAR(40),
	CONSTRAINT FK_Preditor FOREIGN KEY (preditor_genus,preditor_species) REFERENCES organism(genus,species),
	CONSTRAINT FK_Prey FOREIGN KEY (prey_genus, prey_species) REFERENCES organism(genus,species)
	CONSTRAINT PK_Foodchain PRIMARY KEY (prey_genus,prey_species, preditor_genus, preditor_species)
);



