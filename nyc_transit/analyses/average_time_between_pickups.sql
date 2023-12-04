WITH TaxiTripsWithLead AS (
    SELECT
        pulocationid AS pickup_location,
        pickup_datetime,
        LEAD(pickup_datetime) OVER (PARTITION BY pulocationid ORDER BY pickup_datetime) AS next_pickup_datetime
    FROM
        {{ref('mart__fact_all_taxi_trips')}}
    WHERE
        pulocationid IS NOT NULL
)
SELECT
    pickup_location AS pickup_zone,
    AVG(EXTRACT(EPOCH FROM (next_pickup_datetime - pickup_datetime)) / 60) AS avg_time_between_pickups_minutes
FROM
    TaxiTripsWithLead
WHERE
    next_pickup_datetime IS NOT NULL
GROUP BY
    pickup_location;