{{ config(materialized='table') }}

SELECT DISTINCT
    Airport_code,
    model,
    manufacturer
FROM {{ ref('stg_airports') }}
