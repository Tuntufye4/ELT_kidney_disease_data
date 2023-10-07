
with source as (

    select * from {{ source('kidney_disease_source', 'kidney_disease') }}
),
final as (

    select 
        s.id as id,
        s.age as age,
        s.bp as bp,
        s.sg as specific_gravity,
        s.albumin as albumin,
        s.sugar as sugar,
        s.red_blood_cell_count as red_blood_cell_count,
        s.pus_cells as pus_cells,
        s.pcs as pathological_casts,
        s.ba as ba,
        s.bgr as blood_glucose_random,
        s.bu as blood_urea,
        s.sc as serum_creatinine,
        s.sodium as sodium,
        s.potassium as potassium,
        s.Hemoglobin as Hemoglobin,
        s.pcv as packed_cell_volume,
        s.wbcc as white_blood_cell_count,
        s.rbcc as red_blood_cell_count_fig,
        s.htn as htn,
        s.dm as diabetes_mellitus,
        s.cad as coronary_artery_disease,
        s.appetite  as appetite,
        s.pe as pedal_edema,
        s.anemia as anemia,
        s.classification as classification

    from source s
)

select * from final
