INSERT INTO foodchain (
	prey_species,
	prey_genus,
	preditor_speices,
	preditor_genus
)
VALUES (
	'macrochirus',
	'lepomis',
	'salmoides',
	'micropterus'
)

INSERT INTO organism (
	species,
	genus,
	kingdom,
	habitat,
	conservation_status,
	population
)
VALUES (
	'small',
	'fish',
	'animal',
	'fresh water',
	'G5',
	1000000
);

-- query all species who eat endangered species
SELECT
	genus,
	species
FROM
	organism
WHERE
	(genus, species) IN (
		SELECT
			preditor_genus,
			preditor_species
		FROM
			foodchain
		WHERE
			(prey_genus, prey_species) IN (
				SELECT
					genus,
					species
				WHERE
					conservation_status IN ('G3', 'G2', 'G1')
					
			)	
	);
