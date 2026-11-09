{{ config(
    materialized = 'table',
    schema = 'dw_insurance'
)}}

SELECT
    cu.customer_key,
    a.agent_key,
    d.date_key,
    c.call_duration_min,
    c.issue_type,
    c.resolution_status
FROM {{ ref('stg_customer_service_interactions') }} c
INNER JOIN {{ ref('dim_customer') }} cu
    ON c.customer_first_name = cu.firstname
    AND c.customer_last_name = cu.lastname
INNER JOIN {{ ref('dim_agent') }} a
    ON c.agent_first_name = a.firstname
    AND c.agent_last_name = a.lastname
INNER JOIN {{ ref('dim_date') }} d
    ON d.date_key = c.interaction_date
