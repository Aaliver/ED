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
listaOrd (y:ys) = ordena y (listaOrd ys)


{- Función: ordena
   Descripción: Ordena una tupla en una lista de manera
   descendente respecto al segundo valor de las tuplas
   Uso: 
-}
ordena :: (Char, Int) -> [(Char, Int)] -> [(Char, Int)]
ordena e [] = [e]
ordena e (y:ys) =
  if snd e >= snd y
  then e:y:ys
  else y:(ordena e ys)


{- Función: construye
   Descripción: Construye un árbol con ciertos elementos
   Uso: 
-}
construye :: Arbol Char -> [(Char, Int)] -> Arbol Char
construye ab [] = ab
construye ab (y:ys) = construye (inserta (fst y) ab) (ys)


{- Función: inserta
   Descripción: Inserta un alemento a un árbol
   Uso: inserta 0 Vacio = AB 0 Vacio Vacio
-}
inserta :: Char -> Arbol Char -> Arbol Char
inserta e Vacio = AB '0' (AB '0' Vacio Vacio) (AB e Vacio Vacio)
inserta e (AB r t1 Vacio) = AB r t1 (AB e Vacio Vacio)
inserta e (AB r t1 t2) = AB r (inserta e t1) t2
