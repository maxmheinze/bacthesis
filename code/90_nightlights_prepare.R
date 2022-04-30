
# Header ------------------------------------------------------------------

pacman::p_load(
  tidyverse,
  sf,
  raster,
  rgdal
)

# Load Shapefile ----------------------------------------------------------

adm0 <- st_read("./data/idn_admbnda_adm0_bps_20200401.shp")


# Crop Nightlight Rasters for Easier Computation --------------------------

# data2012 <- raster("/Users/maxheinze 1/Library/Mobile Documents/com~apple~CloudDocs/WU/05 Bachelorarbeit/nightlights_data/VNL_v2_npp_2012_global_vcmcfg_c202102150000.median_masked.tif")
# cropped2012 <- crop(data2012, extent(adm0))
# writeRaster(cropped2012,'/Users/maxheinze 1/Library/Mobile Documents/com~apple~CloudDocs/WU/05 Bachelorarbeit/nightlights_data/idn_nightlights_2012.tif')
# rm(data2012, cropped2012)

# data2013 <- raster("/Users/maxheinze 1/Library/Mobile Documents/com~apple~CloudDocs/WU/05 Bachelorarbeit/nightlights_data/VNL_v2_npp_2013_global_vcmcfg_c202102150000.median_masked.tif")
# cropped2013 <- crop(data2013, extent(adm0))
# writeRaster(cropped2013,'/Users/maxheinze 1/Library/Mobile Documents/com~apple~CloudDocs/WU/05 Bachelorarbeit/nightlights_data/idn_nightlights_2013.tif')
# rm(data2013, cropped2013)

# data2014 <- raster("/Users/maxheinze 1/Library/Mobile Documents/com~apple~CloudDocs/WU/05 Bachelorarbeit/nightlights_data/VNL_v2_npp_2014_global_vcmslcfg_c202102150000.median_masked.tif")
# cropped2014 <- crop(data2014, extent(adm0))
# writeRaster(cropped2014,'/Users/maxheinze 1/Library/Mobile Documents/com~apple~CloudDocs/WU/05 Bachelorarbeit/nightlights_data/idn_nightlights_2014.tif')
# rm(data2014, cropped2014)

# data2015 <- raster("/Users/maxheinze 1/Library/Mobile Documents/com~apple~CloudDocs/WU/05 Bachelorarbeit/nightlights_data/VNL_v2_npp_2015_global_vcmslcfg_c202102150000.median_masked.tif")
# cropped2015 <- crop(data2015, extent(adm0))
# writeRaster(cropped2015,'/Users/maxheinze 1/Library/Mobile Documents/com~apple~CloudDocs/WU/05 Bachelorarbeit/nightlights_data/idn_nightlights_2015.tif')
# rm(data2015, cropped2015)

# data2016 <- raster("/Users/maxheinze 1/Library/Mobile Documents/com~apple~CloudDocs/WU/05 Bachelorarbeit/nightlights_data/VNL_v2_npp_2016_global_vcmslcfg_c202102150000.median_masked.tif")
# cropped2016 <- crop(data2016, extent(adm0))
# writeRaster(cropped2016,'/Users/maxheinze 1/Library/Mobile Documents/com~apple~CloudDocs/WU/05 Bachelorarbeit/nightlights_data/idn_nightlights_2016.tif')
# rm(data2016, cropped2016)

# data2017 <- raster("/Users/maxheinze 1/Library/Mobile Documents/com~apple~CloudDocs/WU/05 Bachelorarbeit/nightlights_data/VNL_v2_npp_2017_global_vcmslcfg_c202102150000.median_masked.tif")
# cropped2017 <- crop(data2017, extent(adm0))
# writeRaster(cropped2017,'/Users/maxheinze 1/Library/Mobile Documents/com~apple~CloudDocs/WU/05 Bachelorarbeit/nightlights_data/idn_nightlights_2017.tif')
# rm(data2017, cropped2017)

# data2018 <- raster("/Users/maxheinze 1/Library/Mobile Documents/com~apple~CloudDocs/WU/05 Bachelorarbeit/nightlights_data/VNL_v2_npp_2018_global_vcmslcfg_c202102150000.median_masked.tif")
# cropped2018 <- crop(data2018, extent(adm0))
# writeRaster(cropped2018,'/Users/maxheinze 1/Library/Mobile Documents/com~apple~CloudDocs/WU/05 Bachelorarbeit/nightlights_data/idn_nightlights_2018.tif')
# rm(data2018, cropped2018)

# data2019 <- raster("/Users/maxheinze 1/Library/Mobile Documents/com~apple~CloudDocs/WU/05 Bachelorarbeit/nightlights_data/VNL_v2_npp_2019_global_vcmslcfg_c202102150000.median_masked.tif")
# cropped2019 <- crop(data2019, extent(adm0))
# writeRaster(cropped2019,'/Users/maxheinze 1/Library/Mobile Documents/com~apple~CloudDocs/WU/05 Bachelorarbeit/nightlights_data/idn_nightlights_2019.tif')
# rm(data2019, cropped2019)

# data2020 <- raster("/Users/maxheinze 1/Library/Mobile Documents/com~apple~CloudDocs/WU/05 Bachelorarbeit/nightlights_data/VNL_v2_npp_2020_global_vcmslcfg_c202102150000.median_masked.tif")
# cropped2020 <- crop(data2020, extent(adm0))
# writeRaster(cropped2020,'/Users/maxheinze 1/Library/Mobile Documents/com~apple~CloudDocs/WU/05 Bachelorarbeit/nightlights_data/idn_nightlights_2020.tif')
# rm(data2020, cropped2020)

