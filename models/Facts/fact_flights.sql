SELECT
    "Flight_Id",
    "Aircraft_Id",
    "Airline_Code",
    "Departure_Airport_Code",
    "Destination_Airport_Code"
from {{ ref("stg_individual_flights") }}
