# Práctica 04: Números Naturales y Recursión

## Objetivo de la Práctica

El objetivo de la Práctica 4 ha sido poner en uso los tipos de datos `Natural` y `Matrioska` para crear funciones recursivas.

## Actividades de la Práctica

### Recursión First Steps

En la canción [El Pollito Pio](https://www.youtube.com/watch?v=dhsy6epaJGs) se lleva a cabo el concepto de recursión con la cancion llamandose a si misma a partir del pollito pío, quien vendria siendo el caso base, pues es el elemento minimal en el que termina la canción. Después del pollito pío se agregan más animales de manera secuencial tras los cuales se repiten los animales anteriores en el mismo orden hasta regresar al pollito pío y agregar otro animal, repiendo el ciclo.

### Funciones Recursivas

1. `a_natural`

**Caso Recursivo:** Como se convierte un número `n` a su dato Natural, se pega una `S` de sucesor cada vez que se reste 1 a n.

**Caso Base:** Eventualmente el número `n` llegara a cero, el número natural más pequeño, por lo que se regresa `Cero`.

2. `a_entero`

**Caso Recursivo:** Para convertir un dato Natural a su número entero, sumamos `1` cada vez que se disminuya en la misma cantidad el dato Natural.

**Caso Base:** El dato Natural eventualmente llegara a `Cero` por lo que se regresa `0` para que la suma no se vea afectada.

3. `potenciaNat`

**Caso Recursivo:** Un número `n` elevado a `m` es lo mismo que `n` * `n` ^ `m - 1` hasta que `m - 1` sea igual a 0.

**Caso Base:** Como el dato Natural más pequeño es `Cero` y como la potencia de un número a la 0 es 1, entonces cuando `m - 1` sea `Cero` se regresara el sucesor de cero.

4. `factorialNat`

**Caso Recursivo:** El factorial de un número Natural `n` se obtiene multiplicando todos los números anteriores a `n`.

**Caso Base:** Al disminuir `n` y al ser un dato Natural eventualmente este llega a `Cero`, por lo que se regresa 1, el sucesor de cero, para no arruinar la multiplicación.

5. `mayorIgual`

**Caso Recursivo:** Como se comparan dos Matrioskas, para saber si la primera es mayor o igual a la segunda hay que "abrir" ambas Matrioskas y ver cual llega primero al elemento minimal, `Mati`.

**Casos Base:** Si la primera Matrioska llega primero a `Mati`, la Matrioska más pequeña, entonces la primera Matrioska no es mayor o igual a la segunda y regresa `False`. Si la segunda Matrioska llega primero a `Mati` entonces es más pequeña y regresa `True`. Si ambas llegan a `Mati` al mismo tiempo entonces son iguales y tambien regresa `True`.

6. `aplana`

**Caso Recursivo:** Dada una Matrioska anidada, hay que tomar la Matrioska más externa y pegarla a una lista que contenga a las Matrioskas internas, de mayor a menor, hasta llegar a `Mati` para obtener una lista con todas las Matrioskas que componen a la Matrioska inicial.

**Caso Base:** Como `Mati` es la Matrioska más pequeña y el último elemento de la Matrioska anidada, eventualmente se querra pegar todos los anteriores elemento mayores a `Mati` con el propio `Mati` para completar la lista, pero como es un elemento y no se puede pegar entonces se regresa `[Mati]`.

## Tiempo requerido en realizar la Práctica completa

La Práctica 3 me ha tomado un total de 4 horas en completar.
