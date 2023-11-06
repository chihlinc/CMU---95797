with source as ( select * from {{ source ('main', 'bike_data')}} ),
renamed as ( select
ride_id,
rideable_type,
started_at,
ended_at,
start_station_name,
start_station_id,
end_station_name,
end_station_id,
start_lat,
start_lng,
end_lat,
end_lng, 
member_casual from source ) select * from renamed
Where ride_id is null or
rideable_type is null or
    started_at is null or  
    ended_at is null or
    start_station_name is null or
    start_station_id is null or
    end_station_name is null or
    end_station_id is null or
    start_lat is null or
    start_lng is null or
    end_lat is null or
    end_lng is null or
    member_casual is null 
