import Aux (Arbol(..), lista, listaOrd, construye, frase, letra, elemento, recorta)

{- Función: arbol
   Descripción: Crea un árbol Huffman de acuerdo a la frecuencia
   de la frase dada
   Uso: arbol "olla" = AB ' ' (AB '0' (AB '0' Vacio (AB 'a' Vacio Vacio)) (AB 'o' Vacio Vacio)) (AB 'l' Vacio Vacio)
-}
arbol :: String -> Arbol Char
arbol [] = Vacio
arbol (x:xs) = construye (AB ' ' Vacio Vacio) (listaOrd (lista (x:xs)))


{- Función: encoding
   Descripción: Codifica una cadena a bits
   Uso: encoding "olla" = "0111001"
-}
encoding :: String -> String
encoding "" = ""
encoding (x:xs) = frase (x:xs) (arbol (x:xs))


{- Función: decoding
   Descripción: Decodifica bits a una cadena con el árbol
   Huffman de esa cadena
   Uso: decoding "0111001" (arbol "olla") = "olla"
-}
decoding :: String -> Arbol Char -> String
decoding _ Vacio = error "No existe árbol para decodificar"
decoding "" _ = ""
decoding (x:xs) tree = (letra (elemento (x:xs)) tree):(decoding (recorta (x:xs)) tree)
