library('raster')
library('ncdf4')
library('sf')
library('ggplot2')

nc_file <- 'C:/Users/jackk/OneDrive/Documents/Thesis Work/Mackenzie Delta/ANHA4_mesh_mask.nc'
#nc_ras <- brick(nc_file)


nc_fo <- nc_open(nc_file)
names(nc_fo$dim) #dimensions
names(nc_fo$var) # variables


lat <- ncvar_get(nc_fo, "nav_lat")
lon <- ncvar_get(nc_fo, "nav_lon")

coord <- data.frame(id=1:length(lon),lon=as.vector(lon), lat=as.vector(lat))

dat_shp <- st_as_sf(coord, coords = c('lon','lat'), crs=4326)

st_write(dat_shp,'C:/Users/jackk/OneDrive/Documents/Thesis Work/Mackenzie Delta/grid_cells.shp')
