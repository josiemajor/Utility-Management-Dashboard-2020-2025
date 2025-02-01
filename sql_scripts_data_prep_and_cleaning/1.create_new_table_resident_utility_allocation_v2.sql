USE utility_recovery_project;

CREATE TABLE resident_utility_allocations_v2
AS
SELECT  service_period, 	-- Unpivoting the utility charges and usage columns with UNION to allow proper filtering with data model
		unit_number, 
        unit_status, 
        resident_id, 
        resident_name, 
        number_of_occupants, 
        square_footage, 
        bedrooms, 
        days_occupied, 
        REPLACE((CONCAT("water_charge", "water_usage")), 'water_chargewater_usage', 'Water')
        AS utility_type,
        water_charge AS utility_charge,
        water_usage AS utility_usage
FROM resident_utility_allocations_clean

UNION ALL

SELECT  service_period, 
		unit_number, 
        unit_status, 
        resident_id, 
        resident_name, 
        number_of_occupants, 
        square_footage, 
        bedrooms, 
        days_occupied, 
        REPLACE((CONCAT("sewer_charge", "sewer_usage")), 'sewer_chargesewer_usage', 'Sewer')
        AS utility_type,
        sewer_charge AS utility_charge,
        sewer_usage AS utility_usage
FROM resident_utility_allocations_clean

UNION ALL

SELECT  service_period, 
		unit_number, 
        unit_status, 
        resident_id, 
        resident_name, 
        number_of_occupants, 
        square_footage, 
        bedrooms, 
        days_occupied, 
        REPLACE((CONCAT("gas_charge", "gas_usage")), 'gas_chargegas_usage', 'Gas')
        AS utility_type,
        gas_charge AS utility_charge,
        gas_usage AS utility_usage
FROM resident_utility_allocations_clean

UNION ALL

SELECT  service_period, 
		unit_number, 
        unit_status, 
        resident_id, 
        resident_name, 
        number_of_occupants, 
        square_footage, 
        bedrooms, 
        days_occupied, 
        REPLACE((CONCAT("electric_charge", "electric_usage")), 'electric_chargeelectric_usage', 'Electric')
        AS utility_type,
        electric_charge AS utility_charge,
        electric_usage AS utility_usage
FROM resident_utility_allocations_clean;

