USE utility_recovery_project;

ALTER TABLE resident_utility_allocations_v2        -- addding foreign keys, will use SELECT distinct to create utility lookup table
ADD utility_id TINYINT(1)
	GENERATED ALWAYS AS 
		(CASE 
			WHEN utility_type = "Electric" THEN 1
            WHEN utility_type = "Gas" THEN 2
            WHEN utility_type = "Sewer" THEN 3
            WHEN utility_type = "Water" THEN 4
            ELSE "Null"
		END);

   
ALTER TABLE resident_utility_allocations_v2       -- adding a unit label for unit lookup table
ADD COLUMN unit_label VARCHAR(10);


SET SQL_SAFE_UPDATES = 0;
UPDATE resident_utility_allocations_v2 
	SET unit_label = CONCAT('Unit ', unit_number);
SET SQL_SAFE_UPDATES = 1;



ALTER TABLE property_utility_recovery       -- addding foreign keys, will use SELECT distinct to create utility lookup table
ADD utility_id TINYINT(1)
	GENERATED ALWAYS AS 
		(CASE 
			WHEN utility_type = "Electric" THEN 1
            WHEN utility_type = "Gas" THEN 2
            WHEN utility_type = "Sewer" THEN 3
            WHEN utility_type = "Water" THEN 4
            ELSE "Null"
		END);
