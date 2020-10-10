/* -----------------------------1.- Introducción ------------------------------------*/
/* ------------------ 1.1 Variables ---------------------*/

var nombre = "Carlos";
var entero = 19
print(nombre)
print(entero)
console.log("my name is"+nombre)
console.log(nombre + nombre)
console.log(typeof(nombre)) /// tipo de variable ///

/* data types */

/* boolean */

var data = false;
if (data) {
  console.log("es buleano")
}else{
  console.log("no es buleano")
}

/* null */

var n = null;
console.log(n*32)
console.log(n)

/* undefined */
var a;
console.log(a + 2);

/* number */

var num =3.6;
var ber=6.3;
console.log(num+ber)

/* string */

var name="beau";
var name2="beau";
console.log(name+name2)
console.log(name[0])
console.log(name.length)
console.log(name[name.length -2])

/* object */

var myCar = new Object();
myCar.make = "Ford";
myCar.model = "Mustang";

console.log(myCar.make);

/*--------------------1.2.- String Methods  ---------------------------------*/

var stringOne = "freeCodeCamp is the best place to learn"
var stringTwo = "frontend and backend development"

// charAt() devuelve la posición del string especificado
console.log(stringOne.charAt(1))

// charCodeAt() retorna unicode del caracter

console.log(stringOne.charCodeAt(a))

// concat() concatena strings

console.log(stringOne.concat(stringTwo))

// fromCharCode() de unicode a character

console.log(String.fromCharCode(114))

// indexOf()

console.log(stringTwo.indexOf("end"))

// lastIndexOf() provee

console.log(stringTwo.lastIndexOf("end"))

// match()

console.log(stringTwo.match(/end/g))

// replace()

console.log(stringTwo.replace(/end/g,"END"))

// search() retorna la posición

console.log(stringTwo.search('end'))

// slice() retorna caracteres entre las posiciones indicadas

console.log(stringTwo.slice(2,6))

// split() retorna lista con separacion por " lo que haya aqui "

console.log(stringOne.split(" "))

// substr()

console.log(stringTwo.substr(2,4))

// toLowerCase() and toUpperCase

console.log(stringTwo.toLowerCase())
console.log(stringTwo.toUpperCase())

// trim() remueve los espacios de los extremos

var stringThree = "       hola       "
console.log(stringThree.trim())

/* 1.3 --------------------------- Functions ------------------------ */

function square(number1,number2){
  return number1*number2;
}


/* 1.4 -------------------- compariso operator & If, Else ---------- */

var age = 10;
if(age >= 18){
  console.log("You are an adult");
} else if (age < 2){
  console.log("You are a baby!");
} else if (age < 18){
  console.log("You are a child");
};

// == abstract equality

// === strict equality

console.log(3 == '3')
console.log(3 === '3')

console.log(true == '1')
console.log(true === '1')

console.log(true == 1)
console.log(true === 1)

/* 1.5 ---------------- Null vs Undefined ------------------ */

var test
console.log(test)

test = null

console.log(test)

console.log(typeof null)
console.log(typeof undefined)
console.log(null === undefined)
console.log(null == undefined)
console.log(null === null)
console.log(null == null)
console.log(!null)
console.log(!!null)
console.log(1 + null)
console.log(1 + undefined)

/* 1.6 ----------------- logical operators -------------- */

// AND: &&, OR: 

if (num > 5 || num <10) {
  console.log("Unicycle!")
}

if (num > 5 && num <10) {
  console.log("Unicycle!")
}

/* 1.7 ----------------- JS Nuggets: Ternary Operator ------------- */

var age = 19;

if (age >= 18) {
  console.log("You are an adult");
} else {
  console.log("You are a kid")
};

console.log((age >= 18) ? "You are and adult" : "You are a kid");

var stop;

age > 18 ? (
  console.log("Ok, you can go."),
  stop = false
  ) : (
    console.log("Sorry, you are much too young!"),
    stop = true
    );
    
var firstCheck = false,
    secondCheck = false,
    access = firstCheck ? "Acces denied" : secondCheck ? "Acces denied" : "Acces granted"
    
console.log(access);

/* 1.8 ------------- array basics ----------------------- */

var sandwich = ["peanut butter","jelly","bread"];
var teams = [["Bulls",23],["White Sox",45]];
console.log(sandwich[1])
console.log(teams[0][0])

// especie de funcion/ciclo para el array

sandwich.forEach(function(element){
  console.log(element);
});

/* 1.9 --------------------- Array Methods -------------------- */

var arr = ["a","b","c"];

console.log(arr.push("d")); // agrega un espacio
console.log(arr);

console.log(arr.pop());  // elimina la última observacion
console.log(arr) 

var arr2 = ["g","q"];
console.log(arr.concat(arr2)); // concatena o junta los array

console.log(arr.join("!")); // pone un caracter entre cada objeto y luego lo junta en un estring
console.log(arr.reverse()); // ordena invertidamente el array permanentemente

console.log(arr.shift()); // devuelve el primer caracter y lo elimina de la memoria
console.log(arr)

console.log(arr.unshift("p")) // introduce en el primer casille el valor indicado
console.log(arr);

console.log(arr.slice(1,3)) // devuelve objetos entre la posicion 1 y 3

arr.push("i");
arr.push("f");
console.log(arr);

/* 1.10--------------- copying arrays ----------------------- */

var original = [true,true, undefined,false,null];

// slice
var copy1 =original.slice(0);
console.log(copy1)

/* 2 .--------------------------- LOOPS ----------------------------*/

var ourArray = []
for (var i = 0; i < 5; i++){
  ourArray.push(i);
}
console.log(ourArray)

var ourArray = []
for (var i = 0; i < 5; i++){
  if(i > 2) break;
  ourArray.push(i);
}
console.log(ourArray)

var arr = [10,9,8,7,6];
for (var i = 0; i < arr.length; i++){
  console.log(arr[i]);
}

var arr = [[1,2],[3,4],[5,6]];
for (var i = 0; i < arr.length; i++){
  for (var j=0; j< arr[i].length;j++){
    console.log(arr[i][j]);
  }
}

var n = 0;

while (n<5){
  n++;
  console.log("n = " + n);
}

var i = 0;
do{
  i++;
  console.log("i = " + i)
}while (i < 5);

/* --------------- 2.1 Array iterations ------------------------- */

// forEach

[1,2,3].forEach(function(item,index){
  console.log([item,index]);
});

// map

var three = [1,2,3];
var double = three.map(function(item){
  return item * 2;
});
console.log(double);

// filter

var inst = [1,2,3];
var evens = inst.filter(function(item){
  return item % 2 === 0;
});
console.log(evens);

// reduce

var sum = [1,2,3].reduce(function(result,item){
  return result + item;
},0);
console.log(sum)