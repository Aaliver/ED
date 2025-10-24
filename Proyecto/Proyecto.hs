module Proyecto where

import Aux (Arbol(..), frecuencia, construye, listaOrd, raiz, bits, izquierdo, derecho, elemento)

{- Función: lista
   Descripción: Recibe una cadena de caracteres y regresa una
   lista de tuplas que indica la frecuencia de cada letra.
   Uso: lista "olla" = [('o',1),('l',2),('a',1)]
-}
lista :: String -> [(Char, Int)]
lista "" = []
lista (x:xs) = (x, frecuencia x (x:xs)):(lista [y | y <- xs, y /= x])


{- Función: arbol
   Descripción:
   Uso: arbol (listaOrd (lista "olla")) = AB ' ' (AB '0' (AB '0' Vacio (AB 'a' Vacio Vacio)) (AB 'o' Vacio Vacio)) (AB 'l' Vacio Vacio)
-}
arbol :: [(Char, Int)] -> Arbol Char
arbol (y:ys) = construye (AB ' ' Vacio Vacio) (y:ys)


{- Función: encoding
   Descripción:
   Uso: 
-}
encoding :: String -> Arbol Char -> String
encoding "" ab = ""
encoding (z:zs) ab = (bits z ab) ++ (encoding zs ab)
