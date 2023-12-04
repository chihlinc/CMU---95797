SELECT
    l.borough,
    COUNT(*) AS trip_count
FROM
    {{ref("mart__fact_all_taxi_trips")}} fat
JOIN
    {{ref("mart__dim_locations")}} l ON fat.pulocationid = l.locationid
GROUP BY
    l.borough

