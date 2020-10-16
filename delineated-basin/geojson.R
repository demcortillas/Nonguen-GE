library(rgdal)
library(geojsonio)
library(spdplyr)
library(rmapshaper)
library(reproj)

# Lectura de datos

parque_nonguen      <- readOGR(dsn = "data_vectorial/Reserva", layer = "RESERVA_NONGUEN", verbose = FALSE)
cuencas_nonguen     <- readOGR(dsn = "data_vectorial/Limites/CUENCAS", layer = "CUENCA3", verbose = FALSE)
cuencas_nonguen_SA  <- readOGR(dsn = "data_vectorial/Limites/CUENCAS", layer = "CUENCA4", verbose = FALSE)
AU                  <- readOGR(dsn = "data_vectorial/Bases", layer = "URB", verbose = FALSE)
comunas             <- readOGR(dsn = "data_vectorial/Comunas", layer = "comunas", verbose = FALSE)

# Reproyección que github exije para desplegar los geojson ---> "+proj=utm +zone=48 +a=6377276.345 +b=6356075.41314024 +towgs84=198,881,317,0,0,0,0 +units=m +no_defs +to +proj=longlat +datum=WGS84 +no_defs"

parque_nonguen     <- spTransform(parque_nonguen,      CRS("+proj=utm +zone=48 +a=6377276.345 +b=6356075.41314024 +towgs84=198,881,317,0,0,0,0 +units=m +no_defs +to +proj=longlat +datum=WGS84 +no_defs"))
cuencas_nonguen    <- spTransform(cuencas_nonguen,     CRS("+proj=utm +zone=48 +a=6377276.345 +b=6356075.41314024 +towgs84=198,881,317,0,0,0,0 +units=m +no_defs +to +proj=longlat +datum=WGS84 +no_defs"))
cuencas_nonguen_SA <- spTransform(cuencas_nonguen_SA,  CRS("+proj=utm +zone=48 +a=6377276.345 +b=6356075.41314024 +towgs84=198,881,317,0,0,0,0 +units=m +no_defs +to +proj=longlat +datum=WGS84 +no_defs"))
AU                 <- spTransform(AU,                  CRS("+proj=utm +zone=48 +a=6377276.345 +b=6356075.41314024 +towgs84=198,881,317,0,0,0,0 +units=m +no_defs +to +proj=longlat +datum=WGS84 +no_defs"))
comunas            <- spTransform(comunas,             CRS("+proj=utm +zone=48 +a=6377276.345 +b=6356075.41314024 +towgs84=198,881,317,0,0,0,0 +units=m +no_defs +to +proj=longlat +datum=WGS84 +no_defs"))

# Transformación a geojson

parque_nonguen      <- geojson_json(parque_nonguen)
cuencas_nonguen     <- geojson_json(cuencas_nonguen)
cuencas_nonguen_SA  <- geojson_json(cuencas_nonguen_SA)
AU                  <- geojson_json(AU)
comunas             <- geojson_json(comunas)

# exportar geojson

geojson_write(parque_nonguen, file = "data_vectorial/geojson/parque_nonguen.geojson")
geojson_write(cuencas_nonguen, file = "data_vectorial/geojson/cuencas_nonguen.geojson")
geojson_write(cuencas_nonguen_SA, file = "data_vectorial/geojson/cuencas_nonguen_SA.geojson")
geojson_write(AU, file = "data_vectorial/geojson/AU.geojson")
geojson_write(comunas, file = "data_vectorial/geojson/comunas.geojson")
