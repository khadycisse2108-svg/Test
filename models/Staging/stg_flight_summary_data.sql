SELECT
    "Date" AS "Flight_Date",
    year(try_to_date("Date")) AS "Year",
    "Airline_Code",
    "Airport_Code"
FROM {{ source('RAW', 'FLIGHT_SUMMARY_DATA') }}

