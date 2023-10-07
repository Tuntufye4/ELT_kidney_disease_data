
with ref_kidney_restructure as (
    select * from {{ ref('kidney_restructure') }}
),

final as (
    select
        rk.sugar as sugar,
        rk.Hemoglobin as Hemoglobin,
        percentile_cont(0.25) within group (order by rk.sugar) as sugar_25th_percentile,
        percentile_cont(0.50) within group (order by rk.sugar) as sugar_median,
        percentile_cont(0.75) within group (order by rk.sugar) as sugar_75th_percentile,
        rank() over (order by rk.Hemoglobin desc) as hemoglobin_rank,
        dense_rank() over (order by rk.Hemoglobin desc) as hemoglobin_dense_rank

    from ref_kidney_restructure rk
);

select * from final;
