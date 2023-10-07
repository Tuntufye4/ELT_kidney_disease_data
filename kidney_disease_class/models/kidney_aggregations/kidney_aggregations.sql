
with ref_kidney_restructure as (
    select * from {{ ref('kidney_restructure') }}
),

final as (
    select
        classification,
        max(age) as max_age,
        min(age) as min_age,
        avg(serum_creatinine) as avg_serum_creatinine,
        count(*) as total_patients,
        case
            when hypertension = 'yes' and diabetes_mellitus = 'yes' then 'Both HTN and DM'
            when hypertension = 'yes' then 'HTN Only'
            when diabetes_mellitus = 'yes' then 'DM Only'
            else 'Neither HTN nor DM'
        end as condition_group
    from ref_kidney_restructure
    group by classification, hypertension, diabetes_mellitus
)

select * from final;
