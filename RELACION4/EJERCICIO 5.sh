3. Escribir un programa con variables numericas que calcule f(x) = y donde
y = Z(aiC(x)) donde Z y C son las codificaciones sobre un alfabeto de n
simbolos

abc = c*1 + 2*3 + 1*9 = 18
babc = 3*1 + 2*3 + 1*9 + 2*27 = 72

Dada una palabra ak,......,a1, queremos comparar Z(ak...a1) con Z(aiak...a1)

Z(ak...a1) = Sumatoria desde i=1 hasta k (Z(ai) * n^(i-1))



Z(aiak...a1) = Z(ai) * + (Sumatoria desde i=1 hasta k (Z(ai) * n^(i-1)))


Por tanto Z(aiC(x)) = ( Z(ai) * n^(|C(x)|) ) + x



MACRO V <- Z(C(X)-) la funcion del ejercicio anterior

MACRO: X <- n
X <- 0
X <- X + 1
...(n veces)
X <- X + 1

SOLUCION: (Z(ai) es una variable global)

Z <- X
U <- 1
M <- n

IF X != 0 GOTO A 		//Si X no es 0, su cadena asociada tiene una longitud positiva
GOTO H

[A] X <- Z(C(X)-)       //U <- n^(|C(X)|)           
	U <- U*M
	IF X != 0 GOTO A 	

[H] Y <- Z(ai)*U 		//Y <- ( Z(ai) * n^(|C(x)|) ) + x
	Y <- Y + Z

