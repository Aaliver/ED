data Semestre1 = Ingles | ED | Algebra | ICC | MCA deriving (Show)

{- Función: creditos
   Descripción: Dependiendo de la entrada regresa una lista con
   las materias con esa cantidad de créditos de acuerdo al primer
   semestre de la carrera Ciencias de la Computación
   Uso: creditos 12 = [ICC,MCA]
        creditos 10 = [ED,Algebra]
        creditos 4 = [Ingles]
-}
creditos :: Int -> [Semestre1]
creditos n 
  | n == 4    = [Ingles]
  | n == 10   = [ED,Algebra]
  | n == 12   = [ICC,MCA]
  | otherwise = []


{- Función: negativos
   Descripción: Regresa la cantidad de números negativos de
   la lista dada
   Uso: negativos [-1,2,4,6,-4] = 2
-}
negativos :: [Int] -> Int
negativos xs = length[x | x <- xs, x < 0]


{- Función: primos
   Descripción: Regresa una lista con los números primos según
   la lista dada
   Uso: primos [1..20] =  [2,3,5,7,11,13,17,19]
-}
primos :: [Int] -> [Int]
primos (x:xs) = [x | x <- (x:xs), length[y | y <- [1..x], x `mod` y == 0] == 2]
-- primos xs = [2 * x + 1 | x <- xs, x > 1, 2 * x + 1 < last(xs)]


{- Función: conjuntoLista
   Descripción: Regresa la misma lista dada pero sin términos
   repetidos; simulando un conjunto
   Uso: conjuntoLista [1,2,2,1,3,4] = [1,2,3,4]
-}
conjuntoLista :: [Int] -> [Int]
conjuntoLista [] = []
conjuntoLista (x:xs) = x:(conjuntoLista [y | y <- xs, y /= x])


