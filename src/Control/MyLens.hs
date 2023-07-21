module Control.MyLens where

data Foo = Foo
  { _x   :: Int
  , _y   :: Int
  , _bar :: Bar
  } deriving Show

data Bar = Bar
  { _label :: String
  , _data  :: String
  } deriving Show

someFunc :: IO ()
someFunc = putStrLn "someFunc"
