SELECT DISTINCT
        airline_code,
        airline_name,
        description_airline,
        market_cap,
        employees,
        age_employee
FROM {{ ref('stg_airlines') }}
