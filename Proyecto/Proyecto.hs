import Aux (Arbol(..), lista, listaOrd, construye, bits, letra, elemento, recorta)

{- Función: arbol
   Descripción: Crea un árbol binario de acuerdo a la lista
   dada por la función `lista`
   Uso: arbol "olla" = AB ' ' (AB '0' (AB '0' Vacio (AB 'a' Vacio Vacio)) (AB 'o' Vacio Vacio)) (AB 'l' Vacio Vacio)
-}
arbol :: String -> Arbol Char
arbol [] = Vacio
arbol (x:xs) = construye (AB ' ' Vacio Vacio) (listaOrd (lista (x:xs)))


{- Función: encoding
   Descripción: Codifica una cadena a bits con el árbol 
   Huffman de esa cadena
   Uso: encoding "olla" (arbol "olla") = "0111001"
-}
encoding :: String -> Arbol Char -> String
encoding _ Vacio = error "No existe árbol para codificar"
encoding "" _ = ""
encoding (x:xs) tree = (bits x tree) ++ (encoding xs tree)


{- Función: decoding
   Descripción: Decodifica bits a una cadena con el árbol
   Huffman de esa cadena
   Uso: decoding "0111001" (arbol "olla") = "olla"
-}
decoding :: String -> Arbol Char -> String
decoding _ Vacio = error "No existe árbol para decodificar"
decoding "" _ = ""
decoding (x:xs) tree = (letra (elemento (x:xs)) tree):(decoding (recorta (x:xs)) tree)
