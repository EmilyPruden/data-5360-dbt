{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
)}}

SELECT
    first_name,
    last_name,
    email,
    employee_id,
    certification_completion_id,
    PARSE_JSON(certification_json):certification_name::string AS certification_name,
    PARSE_JSON(certification_json):certification_cost::float AS certification_cost,
    PARSE_JSON(certification_json):certification_awarded_date::date AS certification_awarded_date
FROM {{ source('oliver_landing', 'employee_certifications')}}