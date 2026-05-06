with source as (

select * from {{ ref('stg_womenontour') }}

),

yearly_trends as (

select

year_start,
COUNT (DISTINCT artist) as total_artists,
COUNT(tour_title) as total_tours,
SUM(actual_gross) as total_actual_gross,
SUM(adjusted_gross_in_2022_dollars) as total_adjusted_gross,
SUM(shows) as total_shows,
AVG(average_gross) as avg_gross_per_show 

from source

GROUP BY year_start

)

select * from yearly_trends