library(rgrass7)
library(raster)

#You need to do this and manually set up the mapset projection by this command, and then create a new location with the name of newLocation, use the reference from our dem data

system('"C:/Program Files/GRASS GIS 7.4.4/grass74.bat"')

#Initiate the GRASS GIS within R studio
initGRASS(gisBase='C:/Program Files/GRASS GIS 7.4.4', gisDbase='C:/Users/ira syarif/Documents/grassdata', location='newLocation', mapset='PERMANENT', override = TRUE)

setwd("C:/Users/ira syarif/Documents/grassdata/raster")

#read raster image
raster("S07452E110232_S07804E110567_UM_DSM.tif") -> r
#plot(r)
r

#create spatial polygons to crop the raster
extent(430000,448000,9145000,9170000) -> e
p <- as(e, "SpatialPolygons") 
plot(p, add=T) 
crop(r, p) -> c
extent(c) -> ex
r2 <- raster(ex,nrow=nrow(c)/2, ncol=ncol(c)/2)

#resample the cell size if necessary
new_c <- resample(c, r2, method="ngb")
rast <- as(new_c, "SpatialGridDataFrame")
writeRAST(rast, "rast_img", flags = c("overwrite"))
execGRASS("r.info", map = "rast_img")

#set the region based on the mapset
execGRASS("g.region", raster = "rast_img")
out_raster <- readRAST("rast_img")
str(out_raster)
plot(out_raster)

#watershed delineation
execGRASS("r.watershed", flags="overwrite", 
          parameters=list(elevation="rast_img", threshold=50000,
                          drainage= "fdir",stream="upstream", basin="rbasin"))

execGRASS('r.thin', flags='overwrite',
          parameters =  list(input='upstream', 
                             output='riv_thin'))
execGRASS("r.to.vect", flags='overwrite',
          parameters = list(input="riv_thin", 
                            output="streams", type="line"))
execGRASS('r.to.vect', flags='overwrite',
          parameters =  list(input='rbasin', 
                             output='catchments', type="area"))
execGRASS('v.out.ogr', flags=c('overwrite'),
          parameters=list(input='catchments',
                          output="area.shp",type="area",
                          format="ESRI_Shapefile"))
execGRASS('v.out.ogr',flags=c('overwrite'),parameters=list(input='streams',
                                                           output="streams.shp",type="line",format="ESRI_Shapefile"))

shapefile("streams.shp") -> s
shapefile("area.shp") -> a
plot(out_raster)
plot(a, add=T)
plot(s, add=T, col="blue")