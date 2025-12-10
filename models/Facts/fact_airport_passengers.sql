---Which airport has transported the most passengers through it?
WITH passenger_counts AS (
    SELECT
        f."Departure_Airport_Code" AS airport_id,
        SUM(ac.capacity) AS passengers
    FROM {{ ref('dim_individual_flights') }} f
    JOIN {{ ref('dim_aircraft') }} ac
        ON f."Aircraft_Id" = ac.aircraft_id
    GROUP BY f."Departure_Airport_Code"

    UNION ALL

    SELECT
        f."Destination_Airport_Code" AS airport_id,
        SUM(ac.capacity) AS passengers
    FROM {{ ref('dim_individual_flights') }} f
    JOIN {{ ref('dim_aircraft') }} ac
        ON f."Aircraft_Id" = ac.aircraft_id
    GROUP BY f."Destination_Airport_Code"
)

SELECT
    ap."Airport_Code",
    ap."Airport_Name",
    SUM(pc.passengers) AS total_passengers
FROM {{ ref('dim_airport') }} ap
LEFT JOIN passenger_counts pc
    ON ap."Airport_Code" = pc.airport_id
GROUP BY ap."Airport_Code", ap."Airport_Name"
ORDER BY total_passengers DESC
