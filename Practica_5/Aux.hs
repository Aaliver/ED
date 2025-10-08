module Aux where

{- Función: esPar
   Descripción: Identifica si un número es par y regresa V o F
   Uso: esPar 3 = False
-}
esPar :: Int -> Bool
esPar x = x `mod` 2 == 0


{- Función: suma
   Descripción: Regresa la suma de dos números
   Uso: suma 16 7 = 23
        suma 8 (-2) = 6
        suma (-11) 4 = -7
        suma (-7) (-8) = -15
-}
suma :: Int -> Int -> Int
suma 0 m = m
suma n m =
  if n > 0
  then suma (pred n) (succ m)
  else suma (succ n) (pred m)


{- Función: suma
   Descripción: Regresa la resta de dos números
   Uso: resta 20 5 = 15
        resta (-6) 2 = -8
        resta 4 (-11) = 15
        resta (-6) (-8) = 2
-}
resta :: Int -> Int -> Int
resta n 0 = n
resta n m =
  if m > 0
  then resta (pred n) (pred m)
  else resta (succ n) (succ m)


{- Función: multi
   Descripción: Regresa la multiplicación de dos números
   Uso: multi 9 2 = 18
-}
multi :: Int -> Int -> Int
multi m 0 = 0
multi n m = suma n (multi n (resta m 1))


{- Función: dividirPar
   Descripción: Regresa la división de dos números pares
   Uso: dividirPar 40 2 = 20
-}
divPar :: Int -> Int -> Int
divPar n m 
  | m == 0    = error "No se puede divir entre cero"
  | n == m    = 1
  | otherwise = suma 1 (divPar (resta n m) m)
