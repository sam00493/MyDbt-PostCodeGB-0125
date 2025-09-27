with GB_England as (

    select * from {{ ref('STG_Great_Britain_OpenNames') }}

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
GB_England.Region
FROM GB_England
Where GB_England.Country = 'England'
GROUP BY 
GB_England.Country,
GB_England.Place_Name, 
GB_England.Place_Type,
GB_England.Postcode_District, 
GB_England.Populated_Place, 
GB_England."DISTRICT/TOWN", 
GB_England.County, 
GB_England.Region
)

Select * from Final