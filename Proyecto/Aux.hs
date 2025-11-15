module Aux where

data Arbol a = Vacio | AB a (Arbol a) (Arbol a) deriving (Eq, Ord, Show)

{- Función: lista
   Descripción: Recibe una cadena de caracteres y regresa una
   lista de tuplas que indica la frecuencia de cada letra
   Uso: lista "olla" = [('o',1),('l',2),('a',1)]
-}
lista :: String -> [(Char, Int)]
lista "" = []
lista (x:xs) = (x, frecuencia x (x:xs)):(lista [y | y <- xs, y /= x])


{- Función: frecuencia
   Descripción: Regresa la frecuencia con la que aparece un
   caracter en una cadena
   Uso: frecuencia 'a' "olla" = 1
-}
frecuencia :: Char -> String -> Int
frecuencia e "" = 0
frecuencia e (x:xs) =
  if e == x
  then 1 + frecuencia e xs
  else frecuencia e xs


{- Función: listaOrd
   Descripción: Ordena una lista de tuplas según la frecuencia
   del primer carácter
   Uso: listaOrd (lista "olla") = [('l',2),('o',1),('a',1)]
-}
listaOrd :: [(Char, Int)] -> [(Char, Int)]
listaOrd [] = []
listaOrd ((a, b):xs) = ordena (a, b) (listaOrd xs)


{- Función: ordena
   Descripción: Ordena una tupla en una lista de manera
   descendente respecto al segundo valor de las tuplas
   Uso: ordena ('c',3) [('e',5),('a',1)] = [('e',5),('c',3),('a',1)]
-}
ordena :: (Char, Int) -> [(Char, Int)] -> [(Char, Int)]
ordena (a, b) [] = [(a, b)]
ordena (a, b) ((c, d):xs) =
  if b >= d
  then (a, b):(c, d):xs
  else (c, d):(ordena (a, b) xs)


{- Función: construye
   Descripción: Construye un árbol los primeros elementos de
   una lista de tuplas
   Uso: construye (AB '7' Vacio Vacio) [('z',9)] = AB '7' Vacio (AB 'z' Vacio Vacio)
-}
construye :: Arbol Char -> [(Char, Int)] -> Arbol Char
construye tree [] = tree
construye tree ((a, b):xs) = construye (inserta a tree) xs


{- Función: inserta
   Descripción: Inserta un alemento a un árbol en su rama
   derecha
   Uso: inserta '7' Vacio = AB ' ' (AB ' ' Vacio Vacio) (AB '7' Vacio Vacio)
-}
inserta :: Char -> Arbol Char -> Arbol Char
inserta e Vacio = AB ' ' (AB ' ' Vacio Vacio) (AB e Vacio Vacio)
inserta e (AB r t1 Vacio) = AB r t1 (AB e Vacio Vacio)
inserta e (AB r t1 t2) = AB r (inserta e t1) t2


{- Función: frase
   Descripción: Codifica una frase a bits con el árbol Huffman
   de esa cadena
   Uso: frase "olla" (arbol "olla") = "0111001"
-}
frase :: String -> Arbol Char -> String
frase _ Vacio = error "No existe árbol para codificar"
frase "" _ = ""
frase (x:xs) tree = (bits x tree) ++ (frase xs tree)


{- Función: bits
   Descripción: Convierte un caracter a bits 
   Uso: bits 'a' (arbol "olla") = "001"
-}
bits :: Char -> Arbol Char -> String
bits _ Vacio = error "El caracter no existe en el árbol"
bits e (AB r t1 t2) =
  if raiz t2 == e
  then "1"
  else '0':(bits e t1)


{- Función: letra
   Descripción: Convierte bits a un caracter
   Uso: letra "001" (arbol "olla") = 'a'
-}
letra :: String -> Arbol Char -> Char
letra _ Vacio = error "El caracter no existe en el árbol"
letra (x:xs) (AB r t1 t2) =
  if x == '1'
  then raiz t2
  else letra xs t1


{- Función: raiz
   Descripción: Regresa la raiz de un árbol binario
   Uso: raiz (AB '7' (AB 'c' Vacio Vacio) Vacio) = '7'
-}
raiz :: Arbol Char -> Char
raiz Vacio = error "El elemento no existe"
raiz (AB r t1 t2) = r


{- Función: recorta
   Descripción: Corta el primer elemento de una cadena de bits
   Uso: recorta "0111001" = "11001"
-}
recorta :: String -> String
recorta "" = ""
recorta ('1':xs) = xs
recorta (x:xs) = recorta xs
