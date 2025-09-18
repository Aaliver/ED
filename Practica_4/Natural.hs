import Aux (Natural(..), sumaNat, multiNat)

{- Función: a_natural
   Desripción: Convierte un número entero a su dato Natural
   Uso: a_natural 2 = S (S Cero)
-}
a_natural :: Int -> Natural
a_natural 0 = Cero
a_natural n = S (a_natural (n - 1))


{- Función: a_entero
   Desripción: El inverso de la función a_natural, convierte un
   dato Natural a su número entero
   Uso: a_entero Cero = 0
        a_entero (S (S (S Cero))) = 3
-}
a_entero :: Natural -> Int
a_entero Cero = 0
a_entero (S n) = 1 + a_entero n


{- Función: potenciaNat
   Desripción: Regresa un dato Natural n elevado a una potencia m
   Uso: potenciaNat (S (S (S Cero))) (S (S Cero)) = S (S (S (S (S (S (S (S (S Cero))))))))
-}
potenciaNat :: Natural -> Natural -> Natural
potenciaNat n Cero = (S Cero)
potenciaNat n (S m) = multiNat n (potenciaNat n m)


{- Función: factorialNat
   Desripción: Regresa el factorial de un dato Natural
   Uso: factorialNat (S (S (S Cero))) = S (S (S (S (S (S Cero)))))
-}
factorialNat :: Natural -> Natural
factorialNat Cero = (S Cero)
factorialNat (S n) = multiNat (S n) (factorialNat n)


