# Práctica 06: Árboles Binarios

## Objetivo de la Práctica

El objetivo de la Práctica 5 ha sido crear árboles binarios recursivos mediante el tipo de dato Arbol.

## Actividades de la Práctica

### Sintaxis

1. Construir árboles

``` mermaid
graph TD
A((4))-->B((6))
A-->C((7))
B-->D((4))
B-->E((0))
C-->F((8))
C-->G((10))
D-->H((9))
D-->I((Vacio))
F-->J((Vacio))
F-->K((5))
```

``` mermaid
graph TD
A((n))-->B((s))
A-->C((s))
B-->D((i))
B-->E((o))
C-->F((i))
C-->G((t))
D-->H((u))
D-->I((Vacio))
E-->J((k))
E-->K((j))
F-->L((Vacio))
F-->M((n))
J-->N((Vacio))
J-->O((s))
```

2. Representación visual de árboles

- AB 4 (Vacio) (AB 3 Vacio Vacio)

``` mermaid
graph TD
A((4))-->B((Vacio))
A-->C((3))
```

- AB 4 Vacio (AB 3 Vacio (AB 5 Vacio Vacio))

``` mermaid
graph TD
A((4))-->B((Vacio))
A-->C((3))
C-->D((Vacio))
C-->E((5))
```

- AB 3 (AB 7 (AB 12 Vacio Vacio) Vacio) (AB 6 (AB 11 Vacio Vacio) (AB 10 Vacio Vacio))

``` mermaid
graph TD
A((3))-->B((7))
A-->C((6))	
B-->D((12))
B-->E((Vacio))
C-->F((11))
C-->G((10))
```

### ¿Qué sucede cuando la lista que recibe la función `listaArbol` no esta ordenada y cuando lo esta?

La función siempre regresa un árbol binario de busqueda, solo cambia la distribución del mismo dependiendo de la raíz, el primer elemento de la lista.

```
ghci> listaArbol [5,3,7,1,9]
AB 5 (AB 3 (AB 1 Vacio Vacio) Vacio) (AB 7 Vacio (AB 9 Vacio Vacio))
```

```
ghci> listaArbol [5,1,3,7,9]
AB 5 (AB 1 Vacio (AB 3 Vacio Vacio)) (AB 7 Vacio (AB 9 Vacio Vacio))
```

```
ghci> listaArbol [1,3,5,7,9]
AB 1 Vacio (AB 3 Vacio (AB 5 Vacio (AB 7 Vacio (AB 9 Vacio Vacio))))
```

## Tiempo requerido en realizar la Práctica completa

Completar la Prática 6 me ha tomado un total de 5 horas en completar.