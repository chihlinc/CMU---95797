WITH PrecipitationDays AS (
    SELECT
        date,
        prcp AS precipitation,
        snow
    FROM
        {{ ref('stg__central_park_weather') }}
    WHERE
        prcp > 0 OR snow > 0
),
BikeTripsPerDay AS (
    SELECT
        DATE_TRUNC('day', started_at_ts) AS date,
        COUNT(*) AS bike_trips
    FROM
        {{ ref('mart__fact_all_bike_trips') }}
    GROUP BY
        DATE_TRUNC('day', started_at_ts)
),
BikeTripsWithPrev AS (
    SELECT
        b.date,
        b.bike_trips,
        LAG(b.bike_trips) OVER (ORDER BY b.date) AS bike_trips_before
    FROM
        BikeTripsPerDay b
)
SELECT
    AVG(bike_trips_before) AS avg_bike_trips_before_precip,
    AVG(bike_trips) FILTER (WHERE precipitation > 0 OR snow > 0) AS avg_bike_trips_with_precip
FROM
    BikeTripsWithPrev t
JOIN
    PrecipitationDays p ON t.date = p.date;
