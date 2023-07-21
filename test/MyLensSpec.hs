module MyLensSpec (spec) where

import           Control.MyLens
import           Data.Function
import           Test.Hspec

spec :: Spec
spec = do
  let bar = Bar "machikane" "fungyaro"
      foo = Foo 1 2 bar
  describe "getter" $ do
    it "simple get" $
      bar ^. dataGetter `shouldBe` "fungyaro"
    it "complex get" $
      foo ^. (dataGetter . barGetter) `shouldBe` "fungyaro"
  describe "setter" $
    it "simple set" $ do
      let foo' = foo & xSetter .~ 3
      foo' ^. xGetter `shouldBe` 3
