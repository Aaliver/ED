import Aux

{- Función: arbol
   Descripción: Crea un árbol Huffman de acuerdo a la
   frecuencia de la cadena dada
   Uso: arbol "olla" = AB ' ' (AB ' ' (AB ' ' Vacio (AB 'a' Vacio Vacio)) (AB 'o' Vacio Vacio)) (AB 'l' Vacio Vacio)
-}
arbol :: String -> Arbol Char
arbol [] = Vacio
arbol str = construye (AB ' ' Vacio Vacio) (listaOrd (lista str))


{- Función: encode
   Descripción: Codifica una cadena a bits
   Uso: encode "olla" = "0111001"
-}
encode :: String -> String
encode "" = ""
encode str = encodeWith str (arbol str)


{- Función: encodeWith
   Descripción: Codifica una cadena a bits con el árbol
   Huffman de esa cadena
   Uso: encodeWith "olla" (arbol "olla") = "0111001"
-}
encodeWith :: String -> Arbol Char -> String
encodeWith _ Vacio = error "No existe árbol para codificar"
encodeWith "" _ = ""
encodeWith (x:xs) tree = (bits x tree) ++ (encodeWith xs tree)


{- Función: decode
   Descripción: Decodifica bits a una cadena con el árbol
   Huffman de esa cadena
   Uso: decode "0111001" (arbol "olla") = "olla"
-}
decode :: String -> Arbol Char -> String
decode _ Vacio = error "No existe árbol para decodificar"
decode "" _ = ""
decode str tree = (letra str tree):(decode (recorta str) tree)
