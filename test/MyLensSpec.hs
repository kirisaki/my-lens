module MyLensSpec (spec) where

import           Test.Hspec

spec :: Spec
spec =
  describe "test getter" $ do
    it "simple get" $ do
      let x = 1
      let y = 1
      x `shouldBe` y
