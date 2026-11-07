{{ config(
    materialized = 'table',
    schema = 'dw_insurance'
)}}

SELECT
    policyid as policy_key,
    policyid,
    policytype
FROM {{ source('insurance_landing', 'policies')}}