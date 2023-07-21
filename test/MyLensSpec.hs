module MyLensSpec (spec) where

import           Control.MyLens
import           Data.Function
import           Test.Hspec

spec :: Spec
spec = do
  let vbar = Bar "machikane" "fungyaro"
      vfoo = Foo 1 2 vbar
  describe "getter" $ do
    it "simple get" $
      vbar ^. body `shouldBe` "fungyaro"
    it "complex get" $
      vfoo ^. bar ^. body `shouldBe` "fungyaro"
  describe "setter" $
    it "simple set" $ do
      let vfoo' = vfoo & x .~ 3
      vfoo' ^. x `shouldBe` 3
