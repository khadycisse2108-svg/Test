SELECT DISTINCT
    aircraft_id , 
    aircraft_type,
    mass,
    length,
    cost,
    capacity
FROM {{ ref('stg_aircraft') }}
