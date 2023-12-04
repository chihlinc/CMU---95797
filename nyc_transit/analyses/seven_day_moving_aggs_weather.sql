WITH WeatherWithRowNum AS (
    SELECT
        date,
        prcp,
        snow,
        ROW_NUMBER() OVER (ORDER BY date) AS row_num
    FROM
        {{ref('stg__central_park_weather')}}
),
SevenDayWindow AS (
    SELECT
        date,
        prcp,
        snow,
        ROW_NUMBER() OVER (ORDER BY date) AS row_num
    FROM
        WeatherWithRowNum
)
SELECT
    w1.date,
    MIN(w2.prcp) OVER w AS seven_day_min_prcp,
    MAX(w2.prcp) OVER w AS seven_day_max_prcp,
    AVG(w2.prcp) OVER w AS seven_day_avg_prcp,
    SUM(w2.prcp) OVER w AS seven_day_sum_prcp,
    MIN(w2.snow) OVER w AS seven_day_min_snow,
    MAX(w2.snow) OVER w AS seven_day_max_snow,
    AVG(w2.snow) OVER w AS seven_day_avg_snow,
    SUM(w2.snow) OVER w AS seven_day_sum_snow
FROM
    SevenDayWindow w1
JOIN
    SevenDayWindow w2 ON w2.row_num BETWEEN w1.row_num - 3 AND w1.row_num + 3
WINDOW
    w AS (ORDER BY w1.date)
ORDER BY
    w1.date
LIMIT 100
