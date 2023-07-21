module MyLensSpec (spec) where

import           Control.MyLens
import           Test.Hspec

spec :: Spec
spec =
  describe "test getter" $ do
    let bar = Bar "machikane" "fungyaro"
        foo = Foo 1 2 bar
    it "simple get" $
      bar ^. dataGetter `shouldBe` "fungyaro"
    it "complex get" $
      foo ^. (dataGetter . barGetter) `shouldBe` "fungyaro"
