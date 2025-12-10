SELECT
    "Flight_Id",
    "Airline_Code",
    "Aircraft_Id",
    "Departure_Airport_Code",
    "Destination_Airport_Code"
    FROM {{ source('RAW', 'INDIVIDUAL_FLIGHTS') }}
