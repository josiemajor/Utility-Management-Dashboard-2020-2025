CREATE TABLE resident_lookup
AS
SELECT DISTINCT resident_id,
		 resident_name
			
FROM utility_recovery_project.resident_utility_allocations_v2;
