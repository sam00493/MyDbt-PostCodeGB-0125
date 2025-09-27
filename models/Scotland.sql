with GB_Scotland as (

    select * from {{ ref('STG_Great_Britain_OpenNames') }}

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
GB_Scotland.Region
FROM GB_Scotland
Where GB_Scotland.Country = 'Scotland'
GROUP BY 
GB_Scotland.Country,
GB_Scotland.Place_Name, 
GB_Scotland.Place_Type,
GB_Scotland.Postcode_District, 
GB_Scotland.Populated_Place, 
GB_Scotland."DISTRICT/TOWN", 
GB_Scotland.County, 
GB_Scotland.Region
)

Select * from Final