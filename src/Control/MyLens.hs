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

type LensGetter s a = s -> a

xGetter :: LensGetter Foo Int
xGetter = _x

(^.) :: s -> LensGetter s a -> a
s ^. f = f s

someFunc :: IO ()
someFunc = putStrLn "someFunc"
