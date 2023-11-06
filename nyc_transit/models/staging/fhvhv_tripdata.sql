with source as ( select * from {{ source ('main', 'fhvhv_tripdata')}} ),
renamed as ( select hvfhs_license_num from source) select * from renamed;



