module Library where
import PdePreludat

doble :: Number -> Number
doble numero = numero + numero

isVowel :: Char -> Bool
isVowel c = c `elem` "aeiouAEIOU"

type Estrategia a = a -> Persona -> Bool

data Persona = Persona
  { nombre :: String,
    deuda :: Number,
    felicidad :: Number,
    esperanza :: Bool,
    estrategiaEleccion :: Estrategia
  }

type Candidato = Persona -> Persona

conformista :: Estrategia
conformista persona = True

esperanzado :: Estrategia
esperanzado persona
  | esperanza persona = True
  | ((> 74) . felicidad) persona = True
  | otherwise = False

economico :: Estrategia
economico numero persona
  | ((> numero) . deuda) persona = True
  | otherwise = False

nombre2vocales :: Persona -> Bool
nombre2vocales = (== 2) . length . filter isVowel . nombre

sumaDeudas :: [Persona] -> Number
sumaDeudas personas = (sum . filter even) (map deuda personas)

yrigoyen :: Candidato
yrigoyen persona = persona {deuda = ((/ 2) . deuda) persona}

alende :: Candidato
alende persona = persona {esperanza = True, felicidad = ((+ 10) . felicidad) persona}

alsogaray :: Candidato
alsogaray persona = persona {esperanza = False, deuda = ((+ 100) . deuda) persona}

martinezRaymonda :: Candidato
martinezRaymonda = yrigoyen . alende

votacionPersona :: Persona -> [Candidato] -> [Candidato]
votacionPersona _ [] = []
votacionPersona persona (x : xs)
  | estrategiaEleccion persona x persona = x : votacionPersona persona xs
  | otherwise = votacionPersona persona xs