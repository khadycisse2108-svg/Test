SELECT
    "Airport_Code",
    "Airport_Employees",
    "Airport_Name",
    "Airport_Size"
FROM {{ source('RAW', 'AIRPORTS') }}
