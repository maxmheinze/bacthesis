# Documentation: Data


## Global Mining Polygons

 **File Name:** `global_mining_polygons_v1.gpkg`
 
 **Source:** Maus et al., <https://doi.org/10.1594/PANGAEA.910894>
 
 **Contents:** Mining Polygons.
 
 **Granularity:** Georeferenced Polygons.
 
 **Variables:**
 
 * `a`: a
 
**Comments:** --



## Socio-Economic Variables from BPS

 **File Name:** `socec.RDS` and `socec.csv`
 
 **Source:** Badan Pusat Statistik, <https://www.bps.go.id/subject/26/human-development-indices.html#subjekViewTab3>
 
 **Contents:** Variables on income and human development.
 
 **Granularity:** Regency/City level aggregates.
 
 **Variables:**
 
 * `expenditure`: Average expenditure per person and year. [Thousand Rupiahs]
 * `exp_schooling`: Expected years of schooling. [Years]
 * `mean_schooling`: Mean years of schooling. [Years]
 * `life_exp_birth`: Life expectancy at birth. [Years]
 * `hdi`: Human Development Index as calculated by BPS. [1]
 
**Comments:** I downloaded the data from BPS's site as XSLX, merged the files into one workbook manually in Excel and converted them into long format using an R script. The exported RDS and CSV files are in this directory.


## ID Numbers for Cities/Regencies and Provinces

 **File Name:** `city_regency_keys.csv`
 
 **Source:** me, but based on the list of cities and regencies contained in the files listed in the Section "Socio-Economic Variables from BPS."
 
 **Contents:** Unique ID codes for each city (*kota*) and regency (*kabupaten*).
 
 **Granularity:** Regency/City level.
 
 **Variables:**
 
 * `rc_id`: A unique four-digit ID number for each city and regency. The first two digits correspond to the province ID, the last two digits are assigned by region, ascending alphabetically. 

 * `rc_name`: The name of the city or regency.

 * `province_id`: A unique two-digit ID number assigned to each province. Ascending alphabetically.

 * `province_name`: The name of the province.

 * `city`: `TRUE` if the regional entity is a city (*kota*) and `FALSE` if it is a regency (*kabupaten*). 
 
**Comments:** Inconsistencies in the alphabetical assignment of `rc_id` ID numbers can occur when additional cities or regencies appeared after the original compilation of this file. These are then appended at the end of the list of cities/regencies of their corresponding province. For more information on the dataset, see the Section "Socio-Economic Variables from BPS."
