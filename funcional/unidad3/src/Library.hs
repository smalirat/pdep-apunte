module Library where

import Data.String (IsString)
import PdePreludat

doble :: Number -> Number
doble numero = numero + numero

sumaListaDeNumeros :: [Number] -> Number
sumaListaDeNumeros = sum

frecuenciaCardiaca = [80, 100, 120, 128, 130, 123, 125]

{--promedioFrecuenciaCardiaca :: [Number] -> Number
promedioFrecuenciaCardiaca lista = (/ sum lista) (length lista)--}

promedioFrecuenciaCardiaca :: [Number] -> Number
promedioFrecuenciaCardiaca lista = ((/ length lista) . sum) lista

{--frecuenciaCardiacaMinuto :: [Number] -> Number -> Number
frecuenciaCardiacaMinuto lista x = (!! (x / 10)) lista--}

{--frecuenciaCardiacaMinuto :: Number -> [Number] -> Number
frecuenciaCardiacaMinuto x = (!! (x / 10)) --}

frecuenciaCardiacaMinuto :: [Number] -> Number -> Number
frecuenciaCardiacaMinuto lista x = lista !! truncate (x / 10)

frecuenciasHastaMomento :: Number -> [Number] -> [Number]
frecuenciasHastaMomento = take . (/ 10)

{--esCapicua :: (Eq a) => [[a]] -> Bool
esCapicua lista = (==) (concat lista) ((reverse . concat) lista)--}

esCapicua :: (Eq a) => [[a]] -> Bool
esCapicua lista = ((== concat lista) . reverse . concat) lista

duracionLlamadas = (("horarioReducido", [20, 10, 25, 15]), ("horarioNormal", [10, 5, 8, 2, 9, 10]))

cuandoHabloMasMinutos :: ((String, [Number]), (String, [Number])) -> String
cuandoHabloMasMinutos tupla
  | (sum . snd . fst) tupla == (sum . snd . fst) tupla = "Ambas llamadas duraron lo mismo"
  | (sum . snd . fst) tupla > (sum . snd . fst) tupla = (fst . fst) tupla
  | otherwise = (fst . snd) tupla

existsAny :: (a -> Bool) -> [a] -> Bool
existsAny _ [] = False
existsAny f (x : xs) = f x || existsAny f xs -- any

{-- anyTuple3 :: (a -> Bool) -> (a, a, a) -> Bool
anyTuple3 p (x, y, z) = p x || p y || p z
--}

anyTuple3 :: (a -> Bool) -> (a, a, a) -> Bool
anyTuple3 p (x, y, z) = ((|| p x) . (|| p y) . p) z

{--mejor :: (Number -> Number) -> (Number -> Number) -> Number -> Number
mejor f g x
  | (>= ) (f x) (g x) = f x
  | otherwise = g x --}

{--mejor :: (Number -> Number) -> (Number -> Number) -> Number -> Number
mejor f g x
  | ((>= f x) . g) x = f x
  | otherwise =  g x --}

mejor :: (Number -> Number) -> (Number -> Number) -> Number -> Number
mejor f g x = (max (f x) . g) x

aplicarPar :: (a -> b) -> (a, a) -> (b, b)
aplicarPar f (x, y) = (f x, f y)

parDeFns :: (a -> b) -> (a -> c) -> a -> (b, c)
parDeFns f g x = (f x, g x)

esMultiploDeAlguno :: Number -> [Number] -> Bool
esMultiploDeAlguno x = any ((== 0) . (`mod` x))

promedios :: [[Number]] -> [Number]
promedios = map promedioFrecuenciaCardiaca 



