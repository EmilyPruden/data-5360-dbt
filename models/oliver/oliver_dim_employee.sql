{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
)}}

SELECT
    employee_id as employee_key,
    employee_id,
    first_name,
    last_name,
    position,
    hire_date,
    email,
    phone_number
FROM {{ source('oliver_landing', 'employee') }}