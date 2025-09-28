with GB_England as (

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
    Where Country = 'England'
),

final as (
Select
GB_England.Country,
GB_England.Place_Name, 
GB_England.Place_Type,
GB_England.Postcode_District, 
GB_England.Populated_Place, 
GB_England."DISTRICT/TOWN", 
GB_England.County, 
GB_England.Region,
GB_England.Longitude,
GB_England.Latitude
FROM GB_England
)

Select * from Final