3. Escribir un programa con variables numericas que calcule f(x) = 1 si 
x es primo y 0 en caso contrario

MACRO: IF X < Y GOTO Z
(Macro que recibe dos valores y un conjunto de instrucciones al que salta si el primer valor era menor que el segundo)

U <- X					//Almaceno el primer valor en la variable U
V <- Y 
IF U != 0 GOTO A					//Almaceno el segundo valor en la variable V
V <- V + 1

[A] U <- U-1			//Resto una unidad a U
	V <- V-1			//Resto una unidad a V
	IF U != 0 GOTO A 	//Si U (primer valor) aun no es 0, volvemos a empezar y restamos una unidad a cada valor 
	IF V != 0 GOTO Z 	//Si U es 0 y V aun no, V seria mayor que U y saltamos a Z

--------------------------------------------------------------------
EJEMPLOS DE ESTE MACRO:

*********EJEMPLO 1 (NO SE CUMPLE LA CONDICION)*********************
IF 111 < 1 GOTO Z:

	U <- 111
	V <- 1

	U <- 110
	V <- 0
	SE CUMPLE "U != 0" POR LO QUE VOLVEMOS AL PRINCIPIO

	U <- 101
	V <- 0
	SE CUMPLE "U != 0" POR LO QUE VOLVEMOS AL PRINCIPIO

	.
	.
	.
	U <- 000
	V <- 0
	NO SE CUMPLE "U != 0" ASI QUE AVANZAMOS
	NO SE CUMPLE "V != 0" ASI QUE NO SE REALIZA EL SALTO A Z Y SALE DEL MACRO

*********EJEMPLO 2 (SE CUMPLE LA CONDICION)***********************
IF 1 < 11 GOTO Z:

	U <- 1
	V <- 11

	U <- 0
	V <- 10
	NO SE CUMPLE "U != 0" ASI QUE AVANZAMOS
	SE CUMPLE QUE "V != 0" ASI QUE SALTAMOS A Z
------------------------------------------------------------------------------------------------

MACRO: Z <- X % Y         (Y > 0)
(Macro que introduce en una variable Z el resto de la division entre X e Y)

U <- Y 					//Meto la segunda variable en U 
V <- X 					//Meto la primera variable en V

IF V < Y GOTO H 		//Llamo al MACRO anterior, porque si V (que contiene X) es menor que Y, el resto es V (Por ejemplo: 7 % 40 = 7)

[A] U <- U-1       		//Resto una unidad a U       
	V <- V-1			//Resto una unidad a V
	IF U != 0 GOTO A 	//Mientras que U no sea 0, seguimos volviendo al principio y restando una unidad tanto a U como a V (ESTO EQUIVALE A V = X - U = X - Y)
	IF V < Y GOTO H 	//Si U ya es 0, miro si V es menor que Y, porque entonces el resto es V (Por ejemplo: X = 14 // Y = 8 =>  V = 6 // Y = 8 => 6 % 8 = 6)
	U <- Y				//Si V es mayor o igual que Y, meto Y en U y volvemos a empezar [A]
	GOTO A		

[H] Z <- V 				//Metemos el resto en la variable de salida

--------------------------------------------------------------------
EJEMPLOS DE ESTE MACRO:

*********EJEMPLO 1 (EL RESTO DA 0)*********************
Z <- 100 % 10                               (El resto de 4/2 = 0)

	U <- 10
	V <- 100

	NO SE CUMPLE QUE V (100) SEA MENOR QUE Y (10) POR LO QUE SEGUIMOS HACIA [A]

	U <- 1
	V <- 11
	SE CUMPLE "U != 0" ASI QUE VOLVEMOS A [A]

	U <- 0
	V <- 10
	NO SE CUMPLE "U != 0" ASI QUE AVANZAMOS
	NO SE CUMPLE QUE V (10) SEA MENOR QUE Y (10) ASI QUE AVANZAMOS
	U <- 10
	VOLVEMOS A [A]
	U <- 1
	V <- 1
	SE CUMPLE "U != 0" ASI QUE VOLVEMOS A [A]

	U <- 0
	V <- 0
	NO SE CUMPLE "U != 0" ASI QUE AVANZAMOS
	SE CUMPLE QUE V (0) ES MENOR QUE Y (10) ASI QUE VAMOS A [H]

	Z <- 0       //EL RESTO DA 0. ESTA PERFE

*********EJEMPLO 2 (EL RESTO NO DA 0)***********************
Z <- 11 % 10                               (El resto de 3/2 => 1)

	U <- 10
	V <- 11

	NO SE CUMPLE QUE V (11) SEA MENOR QUE Y (10) POR LO QUE SEGUIMOS HACIA [A]

	U <- 1
	V <- 10
	SE CUMPLE "U != 0" ASI QUE VOLVEMOS A [A]

	U <- 0
	V <- 1
	NO SE CUMPLE "U != 0" ASI QUE AVANZAMOS
	SE CUMPLE QUE V (1) ES MENOR QUE Y (10) ASI QUE VAMOS A [H]

	Z <- 1       //EL RESTO DA 1. ESTA PERFE TAMBIEN

*********EJEMPLO 3 (EL DIVISOR ES MAYOR QUE EL DIVIDENDO)***********************
Z <- 10 % 11                               (El resto de 2/3 => 2)

	U <- 11
	V <- 10

	SE CUMPLE QUE V (10) SEA MENOR QUE Y (11) POR LO QUE SEGUIMOS HACIA [H]

	Z <- 10       //EL RESTO DA 2. ESTA PERFESTISIMO
------------------------------------------------------------------------------------------------

SOLUCION: 
(Copiamos el numero de entrada en una variable y vamos disminuyendo esta una a una para realizar las divisiones entre el numero original y todos los que haya entre él y el 1, si en ninguna division obtenemos un 0 como resto, es primo)

5

Variable de entrada: X
Variable de salida: Y

V <- X 					//Meto la entrada X en la variable V

W <- W + 1				//Ponemos un 1 en W

IF W < V GOTO A 		//Si V es mayor que 1 es porque la entrada es 2 o mayor, por lo que vamos a [A]
Y <- 0					//Si llego hasta aqui es porque 1 es mayor o igual que V, por lo que V es 0 o 1 que no son primos. Escribiria un 0 y termina
HALT

[A] V <- V-1			//Restamos una unidad a V (debemos ir desde (X-1) hasta 2 diviendo para ver si existe un divisor diferente a el mismo o a 1)
	IF W < V GOTO B		//Si sigue siendo mayor que 1, vamos a B para ver si esta V es un divisor de X
	Y <- 1				//Si llegamos hasta aqui es porque ningun numero era divisor, por lo tanto es primo, escribimos un 1 y termina
	HALT

[B]	Z <- X % V 			//Introduzco en Z el resto de divir X (valor de entrada) entre V
	IF Z != 0 GOTO A 	//Si el resto es distinto de 0 es porque V no es divisor de X y seguimos comprobando el resto de numeros 
	Y <- 0 				//Si el resto es 0 es porque existe un divisor diferente a 0 y a él mismo, por lo que no es primo, escribimos un 0 y termina
	HALT


--------------------------------------------------------------------
EJEMPLOS

*********EJEMPLO 1 (UN PRIMO)*********************
X : 11 (3)

	V <- 11

	SE CUMPLE QUE 1 ES MENOR QUE V (11) ASI QUE VAMOS A [A]

	V <- 10
	SE CUMPLE QUE 1 ES MENOR QUE V (10) ASI QUE VAMOS A [B]

	Z <- 1
	SE CUMPLE QUE "Z != 0" Y VOLVEMOS A [A]

	V <- 1
	NO SE CUMPLE QUE 1 SEA MENOR QUE V (1) POR LO QUE NINGUN NUMERO ENTRE 1 Y 3, EN ESTE CASO EL 2, ERA DIVISOR, POR LO QUE SI ES PRIMO 
	Y <- 1
	TERMINA EL PROGRAMA

*********EJEMPLO 1 (UN NO PRIMO)*********************
X : 100 (4)

	V <- 100

	SE CUMPLE QUE 1 ES MENOR QUE V (100) ASI QUE VAMOS A [A]

	V <- 11
	SE CUMPLE QUE 1 ES MENOR QUE V (11) ASI QUE VAMOS A [B]

	Z <- 1
	SE CUMPLE QUE "Z != 0" Y VOLVEMOS A [A]

	V <- 10
	SE CUMPLE QUE 1 ES MENOR QUE V (10) ASI QUE VAMOS A [B]

	Z <- 0
	NO SE CUMPLE QUE "Z != 0" POR LO QUE HAY UNA DIVISION QUE HA DADO 0 Y HACE QUE LA ENTRADA NO SEA PRIMA

	Y <- 0
	TERMINA EL PROGRAMA
------------------------------------------------------------------------------------------------