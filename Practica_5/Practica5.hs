module Practica5 where

import Data.Char (toUpper)
import Aux (esPar, suma, multi, divPar)

{- Función: hollerBack
   Desripción: Devuelve la cadena dada en mayusculas
   Uso: hollerBack haskell = HASKELL
-}
hollerBack :: String -> String
hollerBack "" = ""
hollerBack (x:xs) = (toUpper x):(hollerBack xs)


{- Función: palindromo
   Desripción: Regresa un valor booleano dependiendo de si la
   lista dada es palindroma o no
   Uso: palindromo ['a','n','i','l','i','n','a'] = True
-}
palindromo :: Eq a => [a] -> Bool
palindromo [] = True
palindromo [x] = True
palindromo (x:xs) =
  if x == (last xs)
  then palindromo (init xs)
  else False


{- Función: replica
   Desripción: Regresa una lista con m elementos de n 
   Uso: replica 2 5 = [2,2,2,2,2]
-}
replica :: Int -> Int -> [Int]
replica _ 0 = []
replica n m = n:(replica n (m - 1))


{- Función: recuperaElemento
   Desripción: Devuelve un elemento de la lista según su índice
   Uso: recuperaElemento [2,4,6] 1 = 4
-}
recuperaElemento :: Eq a => [a] -> Int -> a
recuperaElemento (x:_) 0 = x
recuperaElemento [] _ = error "No existe el elemento"
recuperaElemento (x:xs) i =
  if i >= 0 
  then recuperaElemento xs (i - 1)
  else error "No existe el índice"


{- Función: rota
   Desripción: Regresa la lista dada trasladando n veces el
   primer elemento de la lista al final 
   Uso: rota [1,2,3,4,5] 2 = [3,4,5,1,2]
        rota [1,2,3,4,5] (-1) = [5,1,2,3,4]
-}
rota :: [a] -> Int -> [a]
rota [] _ = []
rota xs n 
  | n > 0     = rota (tail xs ++ [head xs]) (n - 1)
  | n < 0     = rota (last xs:init xs) (n + 1)
  | otherwise = xs


{- Función: extranio
   Desripción: 
   Uso: extranio 13 = [13,40,20,10,5,16,8,4,2,1]
-}
extranio :: Int -> [Int]
extranio 1 = [1]
extranio n =
  if (esPar n)
  then n:(extranio (divPar n 2))
  else n:(extranio (suma 1 (multi n 3)))
