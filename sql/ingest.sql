CREATE TABLE yellow_tripdata AS
SELECT *
FROM read_parquet('./data/taxi/yellow_tripdata*.parquet', union_by_name = 
True, filename = True);

CREATE TABLE bike_data AS
SELECT *
FROM read_csv('./data/citibike-tripdata.csv', HEADER=TRUE, FILENAME=TRUE, 
AUTO_DETECT=TRUE);

CREATE TABLE central_park_weather AS
SELECT *
FROM read_csv('./data/central_park_weather.csv', HEADER=TRUE, 
FILENAME=TRUE, AUTO_DETECT=TRUE);

CREATE TABLE fhv_bases AS
SELECT *
FROM read_csv('./data/fhv_bases.csv', HEADER=TRUE, FILENAME=TRUE, 
AUTO_DETECT=TRUE);

CREATE TABLE fhv_tripdata AS
SELECT *
FROM read_parquet('./data/taxi/fhv_tripdata*.parquet', union_by_name =
True, filename = True); 

CREATE TABLE fhvhv_tripdata AS
SELECT *
FROM read_parquet('./data/taxi/fhvhv_tripdata*.parquet', union_by_name =
True, filename = True); 


CREATE TABLE green_tripdata AS
SELECT *
FROM read_parquet('./data/taxi/green_tripdata*.parquet', union_by_name =
True, filename = True); 

CREATE TABLE yellow_tripdata AS
SELECT *
FROM read_parquet('./data/taxi/yellow_tripdata*.parquet', union_by_name =
True, filename = True); 

