# Nonguen-GE

El siguiente repositorio tiene como finalidad compartir el código de generación de reclasificación
de coberturas de suelo para el Parque Nacional Nonguén -Concepción, Chile. El proceso se irá constantemente
actualizando a medida que se afinen los puntos para entrenar las firmas espectrales.

## Herramientas y métodos

<p>El código estará escrito en *javascript* y se ejecutará en la consola que dispone *GEE* y, por lo último, al no poder acceder 
a las variables que se almacenan en dicha consola, se tomará un pantallazo de las variables para afinar tratamientos de dudas 
posterior al respecto de qué significa cada variable.</p>

<p> El archivo [1.-intro_js.js](https://github.com/demcortillas/Nonguen-GE/blob/main/1.-intro_js.js) consiste en una introducción a lo básico de  *js*
 que incluye los tipos de datos, los objetos, métodos de string, métodos de arrays, composición de funciones, operadores lógicos, loops y un otras cosas
básicas para el manejo del programa. Si bien *GEE* tiene su propia manera de interactuar un poco diferente a una consola de *js*, siempre pueden ser útiles
las sentencias básicas para el mejor manejo del código. </p>

<p> El archivo [2.-reclass_nonguen.js](https://github.com/demcortillas/Nonguen-GE/blob/main/2.-reclass_nonguen.js) contiene las sentencias ocupadas
para realizar el proceso reclasificatorio mediante el método *random forest*, y es este script en conjunto con las variables globales de la consola (que no podemos acceder
pero que podemos ver su pantallazo) lo que nos llevará al resultado final.</p>

![Pantallazo de las variables ocupadas](IMAGENES\Pantallazos variables\variales1.png)

> Para consultas y/o aportes en el proceso contactar a [este correo](diegmedina@udec.cl)

## Estado del proceso

![Pantallazo de la última clasificación de coberturas de suelo](IMAGENES\Pantallazos reclass\reclass_1.png)

> Para descargar la imagen en formato *Geotiff* [click aquí](https://drive.google.com/file/d/1s3pQFgFP17JjhZU2eG-B7VdR7W3xF7Lv/view?usp=sharing)

