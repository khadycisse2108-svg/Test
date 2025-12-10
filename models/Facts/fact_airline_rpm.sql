WITH rpm_clean AS (
    SELECT
        "Airline_Code",
        "Year",
        COALESCE("RPM_Domestic", 0) AS rpm_domestic,
        COALESCE("RPM_International", 0) AS rpm_international,
        COALESCE("RPM_Domestic", 0) + COALESCE("RPM_International", 0) AS rpm_total
    FROM {{ ref('stg_flight_summary_data') }}
),

best_domestic AS (
    SELECT
        "Airline_Code",
        "Year" AS best_year_rpm_domestic
    FROM rpm_clean
    QUALIFY ROW_NUMBER() OVER (PARTITION BY "Airline_Code" ORDER BY rpm_domestic DESC) = 1
),

best_international AS (
    SELECT
        "Airline_Code",
        "Year" AS best_year_rpm_international
    FROM rpm_clean
    QUALIFY ROW_NUMBER() OVER (PARTITION BY "Airline_Code" ORDER BY rpm_international DESC) = 1
),

best_total AS (
    SELECT
        "Airline_Code",
        "Year" AS best_year_rpm_total
    FROM rpm_clean
    QUALIFY ROW_NUMBER() OVER (PARTITION BY "Airline_Code" ORDER BY rpm_total DESC) = 1
)

SELECT
    a.airline_code,
    a.airline_name,
    bd.best_year_rpm_domestic,
    bi.best_year_rpm_international,
    bt.best_year_rpm_total
FROM {{ ref('dim_airline') }} a
LEFT JOIN best_domestic bd ON a.airline_code = bd."Airline_Code"
LEFT JOIN best_international bi ON a.airline_code = bi."Airline_Code"
LEFT JOIN best_total bt ON a.airline_code = bt."Airline_Code"

