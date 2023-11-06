with source as ( select * from {{ source ('main', 'fhv_bases')}}
),
renamed as ( select 
base_number,base_name 
) select * from renamed  

