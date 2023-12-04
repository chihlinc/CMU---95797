WITH WeatherWithRowNum AS (
    SELECT
        date,
        prcp AS precipitation,  
        ROW_NUMBER() OVER (ORDER BY date) AS row_num
    FROM
        {{ref('stg__central_park_weather')}}
)
SELECT
    w1.date,
    w1.precipitation,
    AVG(w2.precipitation) AS seven_day_moving_avg
FROM
    WeatherWithRowNum w1
JOIN
    WeatherWithRowNum w2 ON w2.row_num BETWEEN w1.row_num - 3 AND w1.row_num + 3
GROUP BY
    w1.date, w1.precipitation
ORDER BY
    w1.date
LIMIT 100
