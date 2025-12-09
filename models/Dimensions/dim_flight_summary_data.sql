{{ config(materialized='table') }}

SELECT DISTINCT
    flight_date,
    model,
    manufacturer
FROM {{ ref('stg_flight_summary_data') }}
