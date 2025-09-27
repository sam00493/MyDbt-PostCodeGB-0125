
{{
  config(
    materialized='table'
  )
}}


with GB_OpenNames as (

Select 
Name1 as Place_Name, 
LOCAL_TYPE as Place_Type,
postcode_district as Postcode_District, 
populated_place as Populated_Place, 
DISTRICT_BOROUGH as "DISTRICT/TOWN", 
COUNTY_UNITARY as County, 
Region, 
Country
From PRS_OPEN_NAMES_SCH.PRS_NAMED_PLACE_TBL 
)

Select * FROM GB_OpenNames