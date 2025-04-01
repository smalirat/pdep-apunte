module Spec where

import Library
import PdePreludat
import Test.Hspec

correrTests :: IO ()
correrTests = hspec $ do
  describe "Test de ejemplo" $ do
    it "El pdepreludat se instaló correctamente" $ do
      doble 1 `shouldBe` 2
  describe "Unidad 3" $ do
    it "Promedio entre la suma de una lista y su largo" $ do
      promedioFrecuenciaCardiaca frecuenciaCardiaca `shouldBe` 115.14285714285714285
    it "Fecuencia cardiaca del minuto elejido" $ do
      frecuenciaCardiacaMinuto frecuenciaCardiaca 20 `shouldBe` 120
    it "Lista de frecuencias hasta el minuto elejido" $ do
      frecuenciasHastaMomento 20 frecuenciaCardiaca `shouldBe` [80, 100, 12]
    it "Lista de listas es capicua, incluye elementos comparables" $ do
      esCapicua ["ne", "uq", "uen"] `shouldBe` True
    it "Cual llamada es mas larga" $ do
      cuandoHabloMasMinutos duracionLlamadas `shouldBe` "horarioReducido"