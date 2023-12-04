-- Assuming "l" is an alias for mart__dim_locations
WITH trips_by_borough AS (
  SELECT
    l.borough,
    COUNT(*) AS trip_count
  FROM
    {{ref('mart__fact_all_taxi_trips')}} t
    JOIN {{ ref('mart__dim_locations')}} l ON t.pulocationid = l.locationid
  GROUP BY
    l.borough
)

-- Pivot the results
SELECT
  {{ dbt_utils.pivot(
      'borough',
      dbt_utils.get_column_values(ref('mart__dim_locations'), 'borough'),
      agg='sum',
      then_value='trip_count',
      prefix='trip_count_',
      suffix=''
  ) }}
FROM
  trips_by_borough;
