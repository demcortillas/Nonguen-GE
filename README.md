# Nonguen-GE

El siguiente repositorio tiene como finalidad compartir el c�digo de generaci�n de reclasificaci�n
de coberturas de suelo para el Parque Nacional Nongu�n -Concepci�n, Chile. El proceso se ir� constantemente
actualizando a medida que se afinen los puntos para entrenar las firmas espectrales.

## Herramientas y m�todos

<p>El c�digo estar� escrito en *javascript* y se ejecutar� en la consola que dispone *GEE* y, por lo �ltimo, al no poder acceder 
a las variables que se almacenan en dicha consola, se tomar� un pantallazo de las variables para afinar tratamientos de dudas 
posterior al respecto de qu� significa cada variable.</p>

El archivo [1-intro.js](https://github.com/demcortillas/Nonguen-GE/blob/main/1-intro.js) consiste en una introducci�n a lo b�sico de  *js*
 que incluye los tipos de datos, los objetos, m�todos de string, m�todos de arrays, composici�n de funciones, operadores l�gicos, loops y un otras cosas
b�sicas para el manejo del programa. Si bien *GEE* tiene su propia manera de interactuar un poco diferente a una consola de *js*, siempre pueden ser �tiles
las sentencias b�sicas para el mejor manejo del c�digo.

El archivo [2-reclass_nonguen.js](https://github.com/demcortillas/Nonguen-GE/blob/main/2-reclass_nonguen.js) contiene las sentencias ocupadas
para realizar el proceso reclasificatorio mediante el m�todo *random forest*, y es este script en conjunto con las variables globales de la consola (que no podemos acceder
pero que podemos ver su pantallazo) lo que nos llevar� al resultado final.

## Clasificaci�n de coberturas de suelo

### Aproximaci�n 1:

Esta estimaci�n se realiza como forma experimental mediante un buffer de 5km al rededor del l�mite de la reserva

![Clasificaci�n con 5km de buffer de l�mite de la reserva]()

Click [aqu�]() para descargar los puntos utilizados
Para descargar la imagen en formato *Geotiff* [click aqu�](https://drive.google.com/file/d/1s3pQFgFP17JjhZU2eG-B7VdR7W3xF7Lv/view?usp=sharing) 

### Aproximaci�n 2:

Delimitaci�n por cuencas aleda�as de la reserva nonguen esta se realiza mediante la delimitaci�n de las cuencas hidrogr�ficas aleda�as al parque Nongu�n.
Se realiza a partir de una imagen srt (click [aqu�]() para descargarla) y mediante un proceso de delimitaci�n de cuencas que se describe [en esta carpeta]()

![Clasificaci�n considerando cuencas aleda�as de la reserva]()

Click [aqu�]() para descargar los puntos utilizados
Para descargar la imagen en formato *Geotiff* [click aqu�]() 

> Para consultas y/o aportes en el proceso contactar a este correo: diegmedina@udec.cl