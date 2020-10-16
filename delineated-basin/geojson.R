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

# Reproyección que github exije para desplegar los geojson ---> "+proj=lcc +lat_1=-20 +lat_2=-10 +datum=WGS84"

parque_nonguen     <- spTransform(parque_nonguen, CRS("+proj=lcc +lat_1=-20 +lat_2=-10 +datum=WGS84"))
cuencas_nonguen    <- spTransform(cuencas_nonguen, CRS("+proj=lcc +lat_1=-20 +lat_2=-10 +datum=WGS84"))
cuencas_nonguen_SA <- spTransform(cuencas_nonguen_SA, CRS("+proj=lcc +lat_1=-20 +lat_2=-10 +datum=WGS84"))
AU                 <- spTransform(AU, CRS("+proj=lcc +lat_1=-20 +lat_2=-10 +datum=WGS84"))
comunas            <- spTransform(comunas, CRS("+proj=lcc +lat_1=-20 +lat_2=-10 +datum=WGS84"))

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
