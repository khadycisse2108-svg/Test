SELECT 
        "Airline_Code" AS airline_code,
        "Airline_Name" AS airline_name,
        "Description" AS description_airline,
        "Market_Cap" AS market_cap,
        "Employees" AS employees,
        "Age" AS age_employee
FROM 
    -- Jinia source with the schema and the table name
    {{source('RAW', 'AIRLINES')}}