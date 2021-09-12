# Documentation: Data

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
 
**Comments:** I downloaded the data from BPS's site in as XSLX, merged the files into one workbook manually in Excel and converted them into long format using an R script. The exported RDS and CSV files are in this directory.