module Aux where

data Arbol a = Vacio | AB a (Arbol a) (Arbol a) deriving (Eq, Ord, Show)

{- Función: frecuencia
   Descripción: Regresa la frecuencia con la que aparece un
   caracter en una cadena.
   Uso: frecuencia 'a' "entrada" = 2
-}
frecuencia :: Char -> String -> Int
frecuencia c "" = 0
frecuencia c (x:xs) =
  if c == x
  then 1 + frecuencia c xs
  else frecuencia c xs 


{- Función: listaOrd
   Descripción: Ordena una lista de tuplas 
   Uso: 
-}
listaOrd :: [(Char, Int)] -> [(Char, Int)]
listaOrd [] = []
listaOrd ((a, b):ys) = ordena (a, b) (listaOrd ys)


{- Función: ordena
   Descripción: Ordena una tupla en una lista de manera
   descendente respecto al segundo valor de las tuplas
   Uso: 
-}
ordena :: (Char, Int) -> [(Char, Int)] -> [(Char, Int)]
ordena (a, b) [] = [(a, b)]
ordena (a, b) ((c, d):ys) =
  if b >= d
  then (a, b):(c, d):ys
  else (c, d):(ordena (a, b) ys)


{- Función: construye
   Descripción: Construye un árbol con ciertos elementos
   Uso: 
-}
construye :: Arbol Char -> [(Char, Int)] -> Arbol Char
construye tree [] = tree
construye tree ((a, b):ys) = construye (inserta a tree) (ys)


{- Función: inserta
   Descripción: Inserta un alemento a un árbol
   Uso: inserta 0 Vacio = AB 0 Vacio Vacio
-}
inserta :: Char -> Arbol Char -> Arbol Char
inserta e Vacio = AB '0' (AB '0' Vacio Vacio) (AB e Vacio Vacio)
inserta e (AB r t1 Vacio) = AB r t1 (AB e Vacio Vacio)
inserta e (AB r t1 t2) = AB r (inserta e t1) t2


{- Función: bits
   Descripción:
   Uso: 
-}
bits :: Char -> Arbol Char -> String
bits e (AB r t1 t2) =
  if raiz t2 == e
  then "1"
  else (raiz t1):(bits e t1)


{- Función: raiz
   Descripción: Regresa la raiz de un árbol binario
   Uso: raiz (AB '7' (AB 'c' Vacio Vacio) Vacio) = '7'
-}
raiz :: Arbol Char -> Char
raiz Vacio = error "El elemento no existe"
raiz (AB r t1 t2) = r


{- Función: letra
   Descripción:
   Uso: 
-}
letra :: String -> Arbol Char -> String
letra ('1':_) (AB r _ t2) = [raiz t2]
letra (z:zs) (AB r t1 t2) = letra zs t1


{- Función: elemento
   Descripción:
   Uso: 
-}
elemento :: String -> String
elemento ('1':_) = "1"
elemento (z:zs) = z:(elemento zs)


{- Función: recorta
   Descripción:
   Uso: 
-}
recorta :: String -> String
recorta ('1':zs) = zs
recorta (z:zs) = recorta zs

