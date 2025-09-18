data Matrioska = Mati | Cont Matrioska deriving (Eq, Show)

{- Función: mayorIgual
   Desripción: Compara dos Matrioskas y nos dice si la primera es
   mayor o igual a la segunda
   Uso: mayorIgual Mati Mati = True
        mayorIgual (Cont (Cont Mati)) (Cont (Cont (Cont Mati))) =  False
-}
mayorIgual :: Matrioska -> Matrioska -> Bool
mayorIgual Mati Mati = True
mayorIgual Mati _ = False
mayorIgual _ Mati = True
mayorIgual (Cont n) (Cont m) = mayorIgual n m


{- Función: aplana
   Desripción: Regresa una lista de todas las Matrioskas que
   componen la Matrioska dada, empezando por la más externa hasta    la más interna
   Uso: aplana Mati = [Mati]
        aplana (Cont (Cont Mati)) = [Cont (Cont Mati), Cont Mati, Mati]
-}
aplana :: Matrioska -> [Matrioska]
aplana Mati = [Mati]
aplana (Cont m) = (Cont m):(aplana m)


