module Spec where

import Library
import PdePreludat
import Test.Hspec

correrTests :: IO ()
correrTests = hspec $ do
  describe "Test de ejemplo" $ do
    it "El pdepreludat se instaló correctamente" $ do
      doble 1 `shouldBe` 2

  describe "Unidad 2" $ do
    it "El segundo numero es múltiplo del primero" $ do
      esMultiploDe 4 12 `shouldBe` True
    it "Es biciesto si es multiplo de 400" $ do
      esBisiesto 400 `shouldBe` True
    it "Es biciesto si es multiplo de 4" $ do
      esBisiesto 24 `shouldBe` True
    it "inversa de la raiz cuadrada de un numero" $ do
      inversaRaizCuadrada 4 `shouldBe` 0.5
    it "Un numero n elevado a otro numero m" $ do
      incrementMCuadradoN 4 3 `shouldBe` 13
    it "Un numero n elevado a otro numero m es par" $ do
      incrementEsPar 4 3 `shouldBe` False
