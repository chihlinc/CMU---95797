WITH FareComparison AS (
    SELECT
        y.fare_amount,
        AVG(y.fare_amount) OVER () AS overall_avg_fare,
        AVG(y.fare_amount) OVER (PARTITION BY l.borough) AS borough_avg_fare_borough,
        AVG(y.fare_amount) OVER (PARTITION BY l.zone) AS zone_avg_fare_zone
    FROM
        {{ref("stg__yellow_tripdata")}} y
    JOIN
        {{ref("mart__dim_locations")}} l ON y.pulocationid = l.locationid
)
SELECT
    fare_amount,
    overall_avg_fare,
    borough_avg_fare_borough,
    zone_avg_fare_zone
FROM
    FareComparison
LIMIT 100;
