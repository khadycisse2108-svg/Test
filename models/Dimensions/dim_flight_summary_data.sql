SELECT DISTINCT
    year(try_to_date("Flight_Date")) AS "Year",
    "Airline_Code",
    "Airport_Code"
FROM {{ ref('stg_flight_summary_data') }}
