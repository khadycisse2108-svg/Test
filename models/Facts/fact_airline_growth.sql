--"What was the best year for growth for each airline?"
WITH flight_counts AS (
    SELECT
        "Airline_Code",
        "Year",
        COALESCE("Flights_Domestic", 0) AS flights_domestic
    FROM {{ ref('stg_flight_summary_data') }}
),

avg_flights_by_year AS (
    SELECT
        "Airline_Code",
        "Year",
        AVG(flights_domestic) AS avg_flights_domestic
    FROM flight_counts
    GROUP BY "Airline_Code", "Year"
),

best_growth_year AS (
    SELECT
        "Airline_Code",
        "Year" AS best_year_growth
    FROM avg_flights_by_year
    QUALIFY ROW_NUMBER() OVER (PARTITION BY "Airline_Code" ORDER BY avg_flights_domestic DESC) = 1
)

SELECT
    a.airline_code,
    a.airline_name,
    bg.best_year_growth
FROM {{ ref('dim_airline') }} a
LEFT JOIN best_growth_year bg ON a.airline_code = bg."Airline_Code"
