// Función para mostrar los descendientes de un vértice

Algoritmo Arboles_y_Grafos
	Definir opc Como Cadena
	Definir opcArbol, opcGrafo Como Cadena
	
	Definir padre, root Como Entero // Almacenan el padre y la raiz de un arbol
	
	Definir NodoRaiz, Hijos, Nodos, CantidadHijos Como Entero
	Dimensionar NodoRaiz(100), Hijos(100,100), Nodos(100), CantidadHijos(100);
	// Conjuntos y matrices para verificar la arquitectura del arbol
	
	Definir contador, n, i, k, nodo Como Entero
	// Variable cuantificadoras para los bucles del algoritmo

	Definir hayRaiz Como Lógico // Identifica el índice del nodo que es la raíz del árbol.
	
	Repetir
		Limpiar Pantalla
		Escribir 'Escoje una opcion.........'
		Escribir '______________________'
		Escribir '(1)   Arboles'
		Escribir '(2)   Cerrar programa'
		Leer opc
		Según opc Hacer
			'1':
				Limpiar Pantalla
				// Ingresar la arquitectura del grafo
				Escribir 'Ingrese el numero de vertices del arbol'
				Leer n
				// Inicializar variables
				Para i<-1 Hasta n Hacer
					CantidadHijos[i] <- 0
					Nodos[i] <- 0
					NodoRaiz[i] <- 0 // 0 indica que no tiene padre
				FinPara
				Limpiar Pantalla
				Para i<-1 Hasta n Hacer
					Escribir 'Ingrese el nodo padre de ', i, ' (o -1 si es la raíz):' 
					Leer NodoRaiz[i]
					Si NodoRaiz[i]=-1 & contador<1 Entonces
						contador<-contador+1
						hayRaiz <- Verdadero
						root <- i
					SiNo
						CantidadHijos[NodoRaiz[i]] <- CantidadHijos[NodoRaiz[i]]+1
						Hijos[NodoRaiz[i],CantidadHijos[NodoRaiz[i]]]<-i
						Nodos[NodoRaiz[i]] <- 1
					FinSi
				FinPara
				Repetir // Marca como vértice interno
					Si hayRaiz=Falso Entonces
						Limpiar Pantalla
						Escribir 'No se definió solo una raíz. El árbol es inválido.'
						Esperar Tecla
						Limpiar Pantalla
						Para i<-1 Hasta n Hacer
							Escribir 'Ingrese el nodo padre de ', i, ' (o -1 si es la raíz):'
							Leer NodoRaiz[i]
							Si NodoRaiz[i]=-1 & contador<1 Entonces
								contador<-contador+1
								hayRaiz <- Verdadero
								root <- i
							SiNo
								CantidadHijos[NodoRaiz[i]] <- CantidadHijos[NodoRaiz[i]]+1
								Hijos[NodoRaiz[i],CantidadHijos[NodoRaiz[i]]]<-i
								Nodos[NodoRaiz[i]] <- 1
							FinSi
						FinPara
					FinSi // Marca como vértice interno
				Hasta Que hayRaiz=Verdadero
				Repetir
					Limpiar Pantalla
					Escribir 'Submenú Árboles'
					Escribir 'a. Mostrar la raíz del árbol'
					Escribir 'b. Padre de un vértice específico'
					Escribir 'c. Hijos de un vértice específico'
					Escribir 'd. Hermanos de un vértice específico'
					Escribir 'e. Antecesores de un vértice específico'
					Escribir 'f. Descendientes de un vértice específico'
					Escribir 'g. Vértices internos'
					Escribir 'h. Hojas'
					Escribir 'i. Subárbol con raíz en un vértice específico'
					Escribir 'j. Volver al menú principal'
					Leer opcArbol
					Según opcArbol Hacer
						'a':
							Limpiar Pantalla
							Escribir 'La raíz del árbol es: ', root
							Esperar Tecla
						'b':
							Limpiar Pantalla
							Escribir 'Ingrese el vértice para encontrar su padre:'
							Leer nodo
							Si NodoRaiz[nodo]<>-1 Entonces
								Escribir 'El padre del vértice ', nodo, ' es: ', NodoRaiz[nodo]
							SiNo
								Escribir 'El vértice ', nodo, ' es la raíz y no tiene padre.'
							FinSi
							Esperar Tecla
						'c':
							Limpiar Pantalla
							Escribir 'Ingrese el vértice para encontrar sus hijos:'
							Leer nodo
							Si CantidadHijos[nodo]>0 Entonces
								Escribir 'Los hijos del vértice ', nodo, ' son:'
								Para i<-1 Hasta CantidadHijos[nodo] Hacer
									Escribir Hijos[nodo,i]
								FinPara
							SiNo
								Escribir 'El vértice ', nodo, ' no tiene hijos.'
							FinSi
							Esperar Tecla
						'd':
							Limpiar Pantalla
							Escribir 'Ingrese el vértice para encontrar sus hermanos:'
							Leer nodo
							padre <- NodoRaiz[nodo]
							Si padre<>-1 Entonces
								Escribir 'Los hermanos del vértice ', nodo, ' son:'
								Para i<-1 Hasta CantidadHijos[padre] Hacer
									Si Hijos[padre,i]<>nodo Entonces
										Escribir Hijos[padre,i]
									FinSi
								FinPara
							SiNo
								Escribir 'El vértice ', nodo, ' es la raíz y no tiene hermanos.'
							FinSi
							Esperar Tecla
						'e':
							Limpiar Pantalla
							Escribir 'Ingrese el vértice para encontrar sus antecesores:'
							Leer nodo
							Mientras nodo<>-1 Hacer
								nodo <- NodoRaiz[nodo]
								Si nodo<>-1 Entonces
									Escribir nodo
								FinSi
							FinMientras
							Esperar Tecla
						'f':
							Limpiar Pantalla
							Escribir 'Ingrese el vértice para encontrar sus descendientes:'
							Leer nodo
							Escribir 'Los descendientes de ', nodo, ' son:'
							Para i<-nodo Hasta n Con Paso 1 Hacer
								Para k<-1 Hasta CantidadHijos[i] Con Paso 1 Hacer
										Escribir Hijos[i,k];
								FinPara
							FinPara
							Esperar Tecla
						'g':
							Limpiar Pantalla
							Escribir 'Los vértices internos del árbol son:'
							Para i<-1 Hasta n Hacer
								Si Nodos[i]=1 Entonces
									Escribir i
								FinSi
							FinPara
							Esperar Tecla
						'h':
							Limpiar Pantalla
							Escribir 'Las hojas del árbol son:'
							Para i<-1 Hasta n Hacer
								Si Nodos[i]=0 Entonces
									Escribir i
								FinSi
							FinPara
							Esperar Tecla
						'i':
							Limpiar Pantalla
							Escribir 'Ingrese el vértice raíz del subárbol:'
							Leer nodo
							Escribir 'El subárbol con raíz en ', nodo, ' es:'
							Para i<-nodo Hasta n Con Paso 1 Hacer
								Para k<-1 Hasta CantidadHijos[i] Con Paso 1 Hacer
									Escribir Hijos[i,k];
								FinPara
							FinPara
							Esperar Tecla
						'j':
							Limpiar Pantalla
							Escribir 'Volviendo al menú principal...'
						De Otro Modo:
							Escribir 'Opción inválida.'
							Esperar Tecla
					FinSegún
				Hasta Que opcArbol='j'
			'2':
				Limpiar Pantalla
				Escribir 'Adios'
			De Otro Modo:
				Limpiar Pantalla
				Escribir opc, ' No es una opción correcta, por favor intentalo de nuevo'
				Escribir 'Pulsa una tecla para continuar...'
				Esperar Tecla
		FinSegún
	Hasta Que (opc=='2')
FinAlgoritmo
