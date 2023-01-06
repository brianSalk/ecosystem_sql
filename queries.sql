-- find all organisms that eat the micropterus salmoides
SELECT 
	preditor_genus,
	preditor_species
FROM
	foodchain
WHERE
	(prev_genus,prey_species) = ('micropterus', 'salmoides')

-- find all organisms that eat endangered species
SELECT
	prev_genus,
	prey_species
FROM 
	foodchain
WHERE
	(prev_genus,prey_species) IN (
		SELECT
			genus,
			species
		FROM
			organisms
		WHERE
			conservation_status IN ('G1','G2','G3')
	)
