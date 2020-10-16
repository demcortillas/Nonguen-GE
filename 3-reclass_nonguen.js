Map.addLayer(CUENCA4)

var COL_SENTINEL = SENTINEL.filterBounds(CUENCA4)
                           .filterDate('2020-01-01','2020-02-01')
                           .sort('CLOUD_COVER',true);

var MOSAICO = COL_SENTINEL.mosaic().clip(CUENCA4); 



var puntos = PINO2.merge(CLARO_VERDE_3)
                  .merge(AGUA4).merge(NATIVO5).merge(PINO6)
                  .merge(EUCALIPTO7).merge(PINO8).merge(DESCONOCIDO9)
                  .merge(SUELOQUEMADO10).merge(QUEMADO11).merge(QUEMADO12)
                  .merge(PINO13).merge(SUELO_NO_QUEMADO14)

var firmas = MOSAICO.sampleRegions({
  collection: puntos,
  properties: ['value'],
  scale: 30
});

print(firmas)

var bandas = ['B1','B2','B3','B4','B5','B6','B7'];

var paleta = ['#a6cee3','#1f78b4','#b2df8a','#33a02c',
              '#fb9a99','#e31a1c','#fdbf6f','#ff7f00',
              '#cab2d6','#6a3d9a','#ffff99','#b15928',
              '#ffffb3','#bebada'
              ];
              
// Clasificar con Random Forest

var clasificador_rf= ee.Classifier.randomForest({
  numberOfTrees: 500,
  variablesPerSplit:3,
  bagFraction: 0.7,
  outOfBagMode: true,
}).train(firmas, 'value', bandas);

var clasificacion_rf = MOSAICO.classify(clasificador_rf);
Map.addLayer(clasificacion_rf, {palette: paleta, min:1, max:12}, 'Clasificación RF');


 Export.image.toDrive({
  image: clasificacion_rf,
  description: 'Nonguen_reclass',
  scale: 30,
  region: CUENCA3,
  fileFormat: 'GeoTIFF',
  formatOptions:{
    cloudOptimized: true
  }
}) 
