
with ref_kidney_restructure as (
    select * from {{ ref('kidney_restructure') }}
),

final as (
    select
        max(rkr.age) as max_age,
        min(rkr.age) as min_age,
        max(rkr.sugar) as max_sugar,
        min(rkr.sugar) as min_sugar,
        max(rkr.Blood_Glucose_Random) as max_blood_glucose_random,
        min(rkr.Blood_Glucose_Random) as min_blood_glucose_random,
        max(rkr.Blood_Urea) as max_blood_urea,
        min(rkr.Blood_Urea) as min_blood_urea,
        max(rkr.Packed_Cell_Volume) as max_packed_cell_volume,
        min(rkr.Packed_Cell_Volume) as min_packed_cell_volume,
        max(rkr.bp) as max_bp,
        min(rkr.bp) as min_bp,
        count(*) as total_patients
    
    from ref_kidney_restructure rkr
)

select * from final;
