{{ config(materialized='table') }}

SELECT DISTINCT
    airline_code,
    model,
    manufacturer
FROM {{ ref('stg_airlines') }}
