with source as (

select * from {{ source('women_on_tour', 'women_on_tour') }}

),

cleaned as (

    select
        `rank` as rank,
        CAST(NULLIF(REPLACE(REPLACE(REGEXP_REPLACE(actual_gross, r'\[[a-z0-9]+\]|[†‡\*]', ''), '$', ''), ',', ''), '') AS NUMERIC) as actual_gross,
        CAST(`Adjusted_gross _in 2022 dollars_` AS NUMERIC) as adjusted_gross_in_2022_dollars,
        artist,
        REGEXP_REPLACE(`tour title`, r'[\[\]†‡\*a-z0-9]+', '') as tour_title,
        SAFE_CAST(SPLIT(year_s_, '–')[OFFSET(0)] AS INT64) as year_start,
        SAFE_CAST(SPLIT(year_s_, '–')[OFFSET(1)] AS INT64) as year_end,
        shows,
        CAST(`Average gross` AS NUMERIC) as average_gross

    from source

)

select * from cleaned