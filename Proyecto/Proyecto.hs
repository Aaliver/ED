module Proyecto where

import Aux (Arbol(..), frecuencia, construye, listaOrd, bits, letra, elemento, recorta)

{-
let arbolito = arbol (lista "AVRAHKADABRA")
let bits = encoding "AVRAHKADABRA" arbolito
decoding bits arbolito 
-}

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
arbol [] = Vacio
arbol (x:xs) = construye (AB ' ' Vacio Vacio) (listaOrd (x:xs))


{- Función: encoding
   Descripción:
   Uso: 
-}
encoding :: String -> Arbol Char -> String
encoding _ Vacio = error "No existe árbol para codificar"
encoding "" _ = ""
encoding (x:xs) tree = (bits x tree) ++ (encoding xs tree)


{- Función: decoding
   Descripción:
   Uso: 
-}
decoding :: String -> Arbol Char -> String
decoding _ Vacio = error "No existe árbol para decodificar"
decoding "" _ = ""
decoding (x:xs) tree = (letra (elemento (x:xs)) tree):(decoding (recorta (x:xs)) tree)
