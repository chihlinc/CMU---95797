SELECT
    COUNT(*) AS trip_count,
    AVG(duration_min) AS average_duration_min
FROM
    {{ref('mart__fact_all_taxi_trips')}} t
JOIN
    {{ref('mart__dim_locations')}} l ON t.pulocationid = l.locationid
GROUP BY
    l.borough,
    l.zone;
