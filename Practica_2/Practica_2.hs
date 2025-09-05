{- Función: sayHello
   Descripción: Imprime la concatenación de dos cadenas
   Uso: sayHello "Haskell" = Hello, Haskell!
-}
sayHello :: String -> IO()
sayHello x = putStrLn("Hello, " ++ x ++ "!")


{- Función: calcularPropina
   Descripción: Regresa una propina del 10% dependiendo de
   la cuenta
   Uso: calcularPropina 1000.9 = 100.09
-}
-- De tipo Double pq hablamos de dinero
calcularPropina :: Double -> Double
calcularPropina x = x * 0.10


{- Función: menor
   Descripción: Regresa el valor mas pequeño de las tres
   entradas dadas
   Uso: menor 123 4 56 = 4
        menor 12 43 6 = 6
        menor 3 46 51 = 2
-}
menor :: Int -> Int -> Int -> Int
menor a b c =
  if a <= b && a <= c
  then a
  else if b <= a && b <= c
       then b
       else c


{- Función: decide
   Descripción: Imprime la primera cadena si el valor booleano
   V es ingresado, de lo contrario imprime la segunda cadena
   Uso: decide True "primera" "segunda" = primera
        decide False "primera" "segunda" = segunda
-}
decide :: Bool -> String -> String -> IO()
decide a b c =
  if a == True
  then putStrLn(b)
  else putStrLn(c)


{- Función: esDescendiente
   Descripción: Regresa el valor booleano V si las cuatro
   entradas fueron ingresadas de mayor a menor, regresa F
   en caso contrario
   Uso: esDescendiente 10 9 8 7 = True
   	esDescendiente 10 9 7 8 = False
-}
esDescendiente :: Int -> Int-> Int -> Int -> Bool
esDescendiente x y z w =
  if x > y && y > z && z > w
  then True
  else False


{- Función: esDivisible
   Descripción: Imprime un texto que indica si la primera
   entrada es divisible por la segunda entrada
   Uso: esDivisible 4 2 = 4 es divisible por 2
   	esDivisible 2 4 = 2 no es divisible por 4
   	esDivisible 4 0 = 4 no es divisible por 0
-}
esDivisible :: Int -> Int -> IO()
esDivisible x y =
  if y /= 0 && x `mod` y == 0
  then putStrLn(show x ++ " es divisible por " ++ show y)
  else putStrLn(show x ++ " no es divisible por " ++ show y)


{- Función: hipotenusa
   Descripción: Regresa la hipotenusa de un triangulo
   rectángulo dados su base y altura
   Uso: hipotenusa 9.0 12.0 = 15.0
-}
hipotenusa :: Double -> Double -> Double
hipotenusa b h = sqrt((b^2) + (h^2))


{- Función: pendiente
   Descripción: Regresa la pendiente de la recta segun los
   puntos dados
   Uso: pendiente (3.0, 2.0) (7.0, 8.0) = 1.5
-}
pendiente :: (Double, Double) -> (Double, Double) -> Double
pendiente (x1, y1) (x2, y2) = (y2 - y1) / (x2 - x1)


{- Función: distanciaPuntos
   Descripción: Regresa la distancia entre dos puntos en el
   plano cartesiano
   Uso: distanciaPuntos (2.0, 1.0) (5.0, 5.0) = 5.0
-}
distanciaPuntos :: (Double, Double) -> (Double, Double) -> Double
distanciaPuntos (x1, y1) (x2, y2) = sqrt((x2 - x1)^2 + (y2 - y1)^2)


-- Extra
{- Función: cuadrados
   Descripción: Regresa los cuadrados del parámetro de
   números dados
   Uso: cuadrados [1..5] = [1,4,9,16,25]
-}
cuadrados :: [Int] -> [Int]
cuadrados xs = [x^2 | x <- xs]


