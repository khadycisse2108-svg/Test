---Which aircraft has flown the most (in terms of number of flights, not distance)"
WITH flight_counts AS (
    SELECT
        "Aircraft_Id",
        COUNT(*) AS total_flights
    FROM {{ ref('dim_individual_flights') }}
    GROUP BY "Aircraft_Id"
)

SELECT
    ac.aircraft_id,
    ac.aircraft_type,
    fc.total_flights
FROM {{ ref('dim_aircraft') }} ac
LEFT JOIN flight_counts fc
    ON ac.aircraft_id = fc."Aircraft_Id"
