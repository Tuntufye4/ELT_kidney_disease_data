with ref_kidney_restructure as (
    select * from {{ ref('kidney_restructure') }}
),
final as (
    select
        rkr.id as id,
        case
            when rkr.bp > 120 then 'High BP'
            else 'Normal BP'
        end as blood_pressure_category,
        case
            when rkr.sugar > 140 then 'High Sugar'
            else 'Normal Sugar'
        end as sugar_category,
        case
            when rkr.hemoglobin < 12 then 'Low Hemoglobin'
            else 'Normal Hemoglobin'
        end as hemoglobin_category,
        case
            when rkr.sodium < 135 then 'Low Sodium'
            else 'Normal Sodium'
        end as sodium_category,
        case
            when rkr.potassium > 5.0 then 'High Potassium'
            else 'Normal Potassium'
        end as potassium_category,
        case
            when rkr.blood_glucose_random > 140 then 'High Blood Glucose'
            else 'Normal Blood Glucose'
        end as blood_glucose_category,
        case
            when rkr.blood_urea > 20 then 'High Blood Urea'
            else 'Normal Blood Urea'
        end as blood_urea_category,
        case
            when rkr.serum > 1.5 then 'High Serum Creatinine'
            else 'Normal Serum Creatinine'
        end as serum_creatinine_category
    from ref_kidney_restructure rkr
)
select * from final;
