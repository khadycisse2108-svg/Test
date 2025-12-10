SELECT DISTINCT
    "Flight_Id",
    "Airline_Code",
    "Aircraft_Id",
    "Departure_Airport_Code",
    "Destination_Airport_Code"
FROM {{ ref('stg_individual_flights') }}
