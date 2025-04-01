module Library where

import PdePreludat

doble :: Number -> Number
doble numero = numero + numero

siguiente :: Number -> Number
siguiente = (1 +)

mitad :: Number -> Number
mitad = (/ 2)

inversa :: Number -> Number
inversa = (1 /)

esPositivo :: Number -> Bool
esPositivo = (>= 0)

esMultiploDe :: Number -> Number -> Bool
esMultiploDe num = (== 0) . (`mod` num)

esPar :: Number -> Bool
esPar = even . (/ 2)

esBisiesto :: Number -> Bool
esBisiesto anio = (||) (esMultiploDe 400 anio) ((&&) (esMultiploDe 4 anio) ((not . esMultiploDe 100) anio))

inversaRaizCuadrada :: Number -> Number
inversaRaizCuadrada = sqrt . inversa

incrementMCuadradoN :: Number -> Number -> Number
incrementMCuadradoN x = (x +) . (^ 2)

incrementEsPar :: Number -> Number -> Bool
incrementEsPar x = even . incrementMCuadradoN x