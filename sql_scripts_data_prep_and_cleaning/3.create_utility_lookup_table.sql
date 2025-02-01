CREATE TABLE utility_lookup
AS
SELECT DISTINCT 
	utility_type,
    utility_id
FROM utility_recovery_project.resident_utility_allocations_v2
ORDER BY utility_id ASC;