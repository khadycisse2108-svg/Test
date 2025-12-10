---"Which aircraft has flown the most?"
SELECT
    f."Aircraft_Id",
    COUNT(*) AS total_flights
FROM {{ ref('dim_individual_flights') }} f
GROUP BY f."Aircraft_Id"
