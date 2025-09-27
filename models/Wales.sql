with GB_Wales as (

    select * from {{ ref('STG_Great_Britain_OpenNames') }}

),

final as (
Select
GB_Wales.Country,
GB_Wales.Place_Name, 
GB_Wales.Place_Type,
GB_Wales.Postcode_District, 
GB_Wales.Populated_Place, 
GB_Wales."DISTRICT/TOWN", 
GB_Wales.County, 
GB_Wales.Region
FROM GB_Wales
Where GB_Wales.Country = 'Wales'
GROUP BY 
GB_Wales.Country,
GB_Wales.Place_Name, 
GB_Wales.Place_Type,
GB_Wales.Postcode_District, 
GB_Wales.Populated_Place, 
GB_Wales."DISTRICT/TOWN", 
GB_Wales.County, 
GB_Wales.Region
)

Select * from Final