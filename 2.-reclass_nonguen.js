Map.addLayer(AREA_INFLUENCIA)
//Map.addLayer(Limite_reserva)

var COL_SENTINEL = SENTINEL.filterBounds(AREA_INFLUENCIA)
                           .filterDate('2020-01-01','2020-02-01')
                           .sort('CLOUD_COVER',true);

var MOSAICO = COL_SENTINEL.mosaic().clip(AREA_INFLUENCIA);

var puntos = PINO1.merge(PINO2).merge(DESCONOCIDO1)
                  .merge(Claros).merge(CUERPO_AGUA)
                  .merge(RENOVAL1).merge(RENOVAL2)
                  .merge(NATIVO1).merge(QUEMADO1)
                  .merge(QUEMADO2).merge(QUEMADO3)
                  .merge(QUEMADO4)

var firmas = MOSAICO.sampleRegions({
  collection: puntos,
  properties: ['VALUE'],
  scale: 30
});

print(firmas)

var bandas = ['B1','B2','B3','B4','B5','B6','B7'];

var paleta = ['#a6cee3','#1f78b4','#b2df8a','#33a02c',
              '#fb9a99','#e31a1c','#fdbf6f','#ff7f00',
              '#cab2d6','#6a3d9a','#ffff99','#b15928'
              ];
              
// Clasificar con Random Forest

var clasificador_rf= ee.Classifier.randomForest({
  numberOfTrees: 500,
  variablesPerSplit:3,
  bagFraction: 0.7,
  outOfBagMode: true,
}).train(firmas, 'VALUE', bandas);

var clasificacion_rf = MOSAICO.classify(clasificador_rf);
Map.addLayer(clasificacion_rf, {palette: paleta, min:1, max:12}, 'Clasificación RF');

/* Export.image.toDrive({
  image: clasificacion_rf,
  description: 'clasificacion_rf2',
  scale: 30,
  region: table,
  fileFormat: 'GeoTIFF',
  formatOptions:{
    cloudOptimized: true
  }
}) */