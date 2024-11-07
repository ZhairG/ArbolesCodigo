// Funci�n para mostrar los descendientes de un v�rtice

Algoritmo Arboles_y_Grafos
	Definir opc Como Cadena
	Definir opcArbol, opcGrafo Como Cadena
	
	Definir padre, root Como Entero // Obtiene el padre o la raiz de un arbol
	
	Definir NodoRaiz, Hijos, Vertices, CantidadHijos Como Entero
	Dimensionar NodoRaiz(100), Hijos(100,100), Vertices(100), CantidadHijos(100);
	// Conjuntos y matrices para verificar la arquitectura del arbol
	
	Definir contador, n, i, k, vertice Como Entero
	Definir hayRaiz Como L�gico // Almacena el �ndice del v�rtice que es la ra�z del �rbol.
	
	Repetir
		Limpiar Pantalla
		Escribir 'Escoje una opcion.........'
		Escribir '______________________'
		Escribir '(1)� �Arboles'
		Escribir '(2)� �Cerrar programa'
		Leer opc
		Seg�n opc Hacer
			'1':
				Limpiar Pantalla
				// Ingresar la arquitectura del grafo
				Escribir 'Ingrese el numero de vertices del arbol'
				Leer n
				// Inicializar variables
				Para i<-1 Hasta n Hacer
					CantidadHijos[i] <- 0
					Vertices[i] <- 0
					NodoRaiz[i] <- 0 // 0 indica que no tiene padre
				FinPara
				Limpiar Pantalla
				Para i<-1 Hasta n Hacer
					Escribir 'Ingrese el nodo padre de ', i, ' (o -1 si es la ra�z):' 
					Leer NodoRaiz[i]
					Si NodoRaiz[i]=-1 & contador<1 Entonces
						contador<-contador+1
						hayRaiz <- Verdadero
						root <- i
					SiNo
						CantidadHijos[NodoRaiz[i]] <- CantidadHijos[NodoRaiz[i]]+1
						Hijos[NodoRaiz[i],CantidadHijos[NodoRaiz[i]]]<-i
						Vertices[NodoRaiz[i]] <- 1
					FinSi
				FinPara
				Repetir // Marca como v�rtice interno
					Si hayRaiz=Falso Entonces
						Limpiar Pantalla
						Escribir 'No se defini� solo una ra�z. El �rbol es inv�lido.'
						Esperar Tecla
						Limpiar Pantalla
						Para i<-1 Hasta n Hacer
							Escribir 'Ingrese el nodo padre de ', i, ' (o -1 si es la ra�z):'
							Leer NodoRaiz[i]
							Si NodoRaiz[i]=-1 & contador<1 Entonces
								contador<-contador+1
								hayRaiz <- Verdadero
								root <- i
							SiNo
								CantidadHijos[NodoRaiz[i]] <- CantidadHijos[NodoRaiz[i]]+1
								Hijos[NodoRaiz[i],CantidadHijos[NodoRaiz[i]]]<-i
								Vertices[NodoRaiz[i]] <- 1
							FinSi
						FinPara
					FinSi // Marca como v�rtice interno
				Hasta Que hayRaiz=Verdadero
				Repetir
					Limpiar Pantalla
					Escribir 'Submen� �rboles'
					Escribir 'a. Mostrar la ra�z del �rbol'
					Escribir 'b. Padre de un v�rtice espec�fico'
					Escribir 'c. Hijos de un v�rtice espec�fico'
					Escribir 'd. Hermanos de un v�rtice espec�fico'
					Escribir 'e. Antecesores de un v�rtice espec�fico'
					Escribir 'f. Descendientes de un v�rtice espec�fico'
					Escribir 'g. V�rtices internos'
					Escribir 'h. Hojas'
					Escribir 'i. Sub�rbol con ra�z en un v�rtice espec�fico'
					Escribir 'j. Volver al men� principal'
					Leer opcArbol
					Seg�n opcArbol Hacer
						'a':
							Limpiar Pantalla
							Escribir 'La ra�z del �rbol es: ', root
							Esperar Tecla
						'b':
							Limpiar Pantalla
							Escribir 'Ingrese el v�rtice para encontrar su padre:'
							Leer vertice
							Si NodoRaiz[vertice]<>-1 Entonces
								Escribir 'El padre del v�rtice ', vertice, ' es: ', NodoRaiz[vertice]
							SiNo
								Escribir 'El v�rtice ', vertice, ' es la ra�z y no tiene padre.'
							FinSi
							Esperar Tecla
						'c':
							Limpiar Pantalla
							Escribir 'Ingrese el v�rtice para encontrar sus hijos:'
							Leer vertice
							Si CantidadHijos[vertice]>0 Entonces
								Escribir 'Los hijos del v�rtice ', vertice, ' son:'
								Para i<-1 Hasta CantidadHijos[vertice] Hacer
									Escribir Hijos[vertice,i]
								FinPara
							SiNo
								Escribir 'El v�rtice ', vertice, ' no tiene hijos.'
							FinSi
							Esperar Tecla
						'd':
							Limpiar Pantalla
							Escribir 'Ingrese el v�rtice para encontrar sus hermanos:'
							Leer vertice
							padre <- NodoRaiz[vertice]
							Si padre<>-1 Entonces
								Escribir 'Los hermanos del v�rtice ', vertice, ' son:'
								Para i<-1 Hasta CantidadHijos[padre] Hacer
									Si Hijos[padre,i]<>vertice Entonces
										Escribir Hijos[padre,i]
									FinSi
								FinPara
							SiNo
								Escribir 'El v�rtice ', vertice, ' es la ra�z y no tiene hermanos.'
							FinSi
							Esperar Tecla
						'e':
							Limpiar Pantalla
							Escribir 'Ingrese el v�rtice para encontrar sus antecesores:'
							Leer vertice
							Mientras vertice<>-1 Hacer
								vertice <- NodoRaiz[vertice]
								Si vertice<>-1 Entonces
									Escribir vertice
								FinSi
							FinMientras
							Esperar Tecla
						'f':
							Limpiar Pantalla
							Escribir 'Ingrese el v�rtice para encontrar sus descendientes:'
							Leer vertice
							Escribir 'Los descendientes de ', vertice, ' son:'
							Para i<-1 Hasta n Con Paso 1 Hacer
								Para k<-1 Hasta CantidadHijos[i] Con Paso 1 Hacer
									Escribir Hijos[i,k];
								FinPara
							FinPara
							Esperar Tecla
						'g':
							Limpiar Pantalla
							Escribir 'Los v�rtices internos del �rbol son:'
							Para i<-1 Hasta n Hacer
								Si Vertices[i]=1 Entonces
									Escribir i
								FinSi
							FinPara
							Esperar Tecla
						'h':
							Limpiar Pantalla
							Escribir 'Las hojas del �rbol son:'
							Para i<-1 Hasta n Hacer
								Si Vertices[i]=0 Entonces
									Escribir i
								FinSi
							FinPara
							Esperar Tecla
						'i':
							Limpiar Pantalla
							Escribir 'Ingrese el v�rtice ra�z del sub�rbol:'
							Leer vertice
							Escribir 'El sub�rbol con ra�z en ', vertice, ' es:'
							Para i<-1 Hasta n Con Paso 1 Hacer
								Para k<-1 Hasta CantidadHijos[i] Con Paso 1 Hacer
									Escribir Hijos[i,k];
								FinPara
							FinPara
							Esperar Tecla
						'j':
							Limpiar Pantalla
							Escribir 'Volviendo al men� principal...'
						De Otro Modo:
							Escribir 'Opci�n inv�lida.'
							Esperar Tecla
					FinSeg�n
				Hasta Que opcArbol='j'
			'2':
				Limpiar Pantalla
				Escribir 'Adios'
			De Otro Modo:
				Limpiar Pantalla
				Escribir opc, ' Esta no es una opci�n correcta, por favor intentalo de nuevo'
				Escribir 'Pulsa una tecla para continuar...'
				Esperar Tecla
		FinSeg�n
	Hasta Que (opc=='2')
FinAlgoritmo
