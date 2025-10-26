import Aux (Arbol(..), frecuencia, construye, listaOrd, bits, letra, elemento, recorta)

{- Función: lista
   Descripción: Recibe una cadena de caracteres y regresa una
   lista de tuplas que indica la frecuencia de cada letra
   Uso: lista "olla" = [('o',1),('l',2),('a',1)]
-}
lista :: String -> [(Char, Int)]
lista "" = []
lista (x:xs) = (x, frecuencia x (x:xs)):(lista [y | y <- xs, y /= x])


{- Función: arbol
   Descripción: Crea un árbol binario de acuerdo a la lista
   dada por la función `lista`
   Uso: arbol (lista "olla") = AB ' ' (AB '0' (AB '0' Vacio (AB 'a' Vacio Vacio)) (AB 'o' Vacio Vacio)) (AB 'l' Vacio Vacio)
-}
arbol :: [(Char, Int)] -> Arbol Char
arbol [] = Vacio
arbol (x:xs) = construye (AB ' ' Vacio Vacio) (listaOrd (x:xs))


{- Función: encoding
   Descripción: Codifica una cadena a bits con el árbol 
   Huffman de esa cadena
   Uso: encoding "olla" (arbol (lista "olla")) = "0111001"
-}
encoding :: String -> Arbol Char -> String
encoding _ Vacio = error "No existe árbol para codificar"
encoding "" _ = ""
encoding (x:xs) tree = (bits x tree) ++ (encoding xs tree)


{- Función: decoding
   Descripción: Decodifica bits a una cadena con el árbol
   Huffman de esa cadena
   Uso: decoding "0111001" (arbol (lista "olla")) = "olla"
-}
decoding :: String -> Arbol Char -> String
decoding _ Vacio = error "No existe árbol para decodificar"
decoding "" _ = ""
decoding (x:xs) tree = (letra (elemento (x:xs)) tree):(decoding (recorta (x:xs)) tree)
