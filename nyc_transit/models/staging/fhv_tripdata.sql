with source as ( select * from {{ source ('main', 'fhv_tripdata')}} ),
renamed as ( select hvfhs_license_num, dispatching_base_num ) select * from renamed 
