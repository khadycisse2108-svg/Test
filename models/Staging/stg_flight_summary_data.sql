SELECT
    "Date" AS "Flight_Date",
    year(try_to_date("Date")) AS "Year",
    "Airline_Code",
    "Airport_Code",
    "RPM_Domestic",
    "RPM_International",
    "Flights_Domestic",
    "Flights_International",
    "Passengers_Domestic",
    "Passengers_International"
FROM {{ source('RAW', 'FLIGHT_SUMMARY_DATA') }}

