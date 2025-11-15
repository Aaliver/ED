# Proyecto: Codificación de Huffman (Variante)

## Objetivo

El objetivo del Proyecto ha sido crear una variante de la codificación Huffman que reduzca el tamaño de los datos de una cadena de caracteres con el arbol correspondiente al codificar y decodificar de cadena a bits y viceversa.

## Funcionamiento

Este proyecto se basa en tres funciones principales:

- **`arbol`**: Recibe una cadena de caracteres y regresa el árbol Huffman de esa cadena.

- **`encode`**: Recibe la cadena a codificar y regresa su representación en bits.

- **`encodeWith`**: Una variante de `encode`. Recibe la cadena a codificar y el árbol Huffman con el que codificarlo. Regresa la cadena codificada.

- **`decode`**: Recibe la cadena de bits a decodificar y el árbol Huffman con el que decodificarlo. Regresa la cadena decodificada.

## Ejecución

### Codificación

```
ghci> encode "Coliseo"
"0110010001000010000011"
```

```
ghci> encodeWith "Coliseo" (arbol "Coliseo")
"0110010001000010000011"
```

### Decodificación

```
ghci> decode "0110010001000010000011" (arbol "Coliseo")
"Coliseo"
```

```
ghci> let binario = encode "Coliseo"
ghci> let arbolito = arbol "Coliseo"
ghci> decode binario arbolito
"Coliseo"
```

## Tiempo requerido en realizar el Proyecto completo

Completar la implemetación de este Proyecto me ha tomado un aproximado de 4 días sin incluir algunas modificaciones posteriores al mejorar algunas funciones. La documentación fue más lenta y se fue completando a lo largo de 2 semanas.
