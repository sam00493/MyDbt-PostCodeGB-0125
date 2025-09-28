with GB_Wales as (

    select
    Country,
    Place_Name, 
    Place_Type,
    Postcode_District, 
    Populated_Place, 
    "DISTRICT/TOWN", 
    County, 
    Region,
    SPLIT_PART(SPLIT_PART(ST_ASWKT(Geography), ' ', 1), 'POINT(', 2) AS Longitude,
    SPLIT_PART(SPLIT_PART(ST_ASWKT(Geography), ' ', 2), ')', 1) AS Latitude
    from {{ ref('STG_Great_Britain_OpenNames') }}
    Where Country = 'Wales'


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
GB_Wales.Region,
GB_Wales.Longitude,
GB_Wales.Latitude
FROM GB_Wales
)

Select * from Final