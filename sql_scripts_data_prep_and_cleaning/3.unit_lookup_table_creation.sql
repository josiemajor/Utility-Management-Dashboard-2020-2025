
CREATE TABLE unit_lookup
AS
SELECT DISTINCT 
	unit_number,
    unit_label,
    square_footage,
    bedrooms
FROM resident_utility_allocations_v2;
