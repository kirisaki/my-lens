module Control.MyLens where

data Foo = Foo
  { _x   :: Int
  , _y   :: Int
  , _bar :: Bar
  } deriving Show

data Bar = Bar
  { _label :: String
  , _body  :: String
  } deriving Show

type Lens s a = (a -> a) -> s -> (a, s)

x :: Lens Foo Int
x f s = (_x s, s { _x = f (_x s) })

body :: Lens Bar String
body f s = (_body s, s { _body = f (_body s) })

bar :: Lens Foo Bar
bar f s = (_bar s, s { _bar = f (_bar s) })

(^.) :: s -> Lens s a -> a
s ^. f = fst $ f id s

(.~) :: Lens s a -> a -> s -> s
f .~ a = snd . f (const a)
