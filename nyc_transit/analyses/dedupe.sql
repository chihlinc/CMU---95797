WITH DeduplicatedEvents AS (
    SELECT
        event_id,
        event_timestamp,
        ROW_NUMBER() OVER (PARTITION BY event_id ORDER BY event_timestamp DESC) AS row_num
    FROM
        {{ref('events')}}
)
SELECT
    event_id,
    event_timestamp
FROM
    DeduplicatedEvents
WHERE
    row_num = 1;
