{{ config(materialized='table') }}

SELECT DISTINCT
    aircraft_id,
    model,
    manufacturer
FROM {{ ref('stg_aircraft') }}
