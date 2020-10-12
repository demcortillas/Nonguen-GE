library(raster)
library(rgrass7)
library(rgdal)

### mañas del programa encontradas en https://gis.stackexchange.com/questions/341451/rgrass7-no-stars-import-yet
library(sp)
use_sp() 
####

# Primero se crea un ambiente grass

im1 <- raster('srtm/1.tif')
im2 <- raster('srtm/2.tif')
im3 <- raster('srtm/3.tif')
im4 <- raster('srtm/4.tif')

Mosaic<-merge(im1,im2,im3,im4,fun=mean)
writeRaster(Mosaic,'Mosaic.tif')

crs<- crs("+init=epsg:32719")
utm <- '+proj=utm +zone=19 + south=T ellps=WGS84'
rr <- raster('Mosaic.tif',overwrite=TRUE)
rr <- setMinMax(rr)
rr[rr <= 0] <-NA

initGRASS(gisBase='C:/Program Files/GRASS GIS 7.8',
          gisDbase='grassdata',
          location='newLocation',
          mapset='PERMANENT',
          override = TRUE)

rr <- projectRaster(rr,crs=crs,res = c(30,30))
rast <- as(rr, "SpatialGridDataFrame")
writeRAST(rast,'rast_img',flags=c("overwrite"))

execGRASS("r.info",map="rast_img") ############

execGRASS("g.region",raster = "rast_img")
out_raster <- readRAST("rast_img")
str(out_raster) #spatialgridataframe

execGRASS("r.watershed",
          flags="overwrite",
          parameters=list(
            elevation="rast_img",
            threshold=5000,
            drainage = "fdir",
            stream="upstream",
            accumulation= "accum",
            basin="rbasin"
            )
          )

# Proces flow accumulation

execGRASS("r.mapcalc",flags = "overwrite",expression="log_accum=log(abs(accum)+1)")
execGRASS("r.mapcalc",flags = "overwrite",expression="inf_rivers=if(log_accum>6.5)")

execGRASS("r.null", map="inf_rivers", setnull = "0")
execGRASS('r.thin', flags='overwrite', parameters = list(input='inf_rivers',output='riv_thin'))

# Convertir a vector y guardar como shp

execGRASS("r.to.vect",flags = 'overwrite',parameters = list(input = "riv_thin",output = "streams", type = "line"))
execGRASS('v.out.ogr',flags=c('overwrite'),parameters=list(input='streams',output="streams.shp",type="line",format="ESRI_Shapefile"))
execGRASS('r.to.vect', flags='overwrite',parameters = list(input='rbasin',output='catchments', type="area"))
execGRASS('v.out.ogr', flags=c('overwrite'),parameters=list(input='catchments',output="area.shp",type="area",format="ESRI_Shapefile"))

s <- shapefile("streams.shp")
a <- shapefile("area.shp")

proj4string(a) <- utm
proj4string(s) <- utm

writeOGR(a,".","area_utm",driver="ESRI Shapefile")
writeOGR(s,".","river_utm",driver="ESRI Shapefile")



