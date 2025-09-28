with GB_Scotland as (

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
    Where Country = 'Scotland'

),

final as (
Select
GB_Scotland.Country,
GB_Scotland.Place_Name, 
GB_Scotland.Place_Type,
GB_Scotland.Postcode_District, 
GB_Scotland.Populated_Place, 
GB_Scotland."DISTRICT/TOWN", 
GB_Scotland.County, 
GB_Scotland.Region,
GB_Scotland.Longitude,
GB_Scotland.Latitude
FROM GB_Scotland
)

Select * from Final