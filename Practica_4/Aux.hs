module Aux where
data Natural = Cero | S Natural deriving (Eq, Show)

{- Función: sumaNat
   Descripción: Regresa la suma de dos naturales
   Uso: sumaNat (S (S (S Cero))) (S (S Cero)) = S (S (S (S (S Cero))))
-}
sumaNat :: Natural -> Natural -> Natural
sumaNat Cero m = m
sumaNat (S n) m = sumaNat n (S m)


{- Función: multiNat
   Descripción: Regresa la multiplicación de dos naturales
   Uso: multiNat (S (S (S Cero))) (S (S Cero)) = S (S (S (S (S (S Cero)))))
-}
multiNat :: Natural -> Natural -> Natural
multiNat m Cero = Cero
multiNat n (S m) = sumaNat n (multiNat n m)


