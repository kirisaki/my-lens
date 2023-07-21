module Control.MyLens where
import           Control.Applicative   (Const (Const, getConst))
import           Data.Functor.Identity (Identity (Identity, runIdentity))

data Foo = Foo
  { _x   :: Int
  , _y   :: Int
  , _bar :: Bar
  } deriving Show

data Bar = Bar
  { _label :: String
  , _body  :: String
  } deriving Show

type Lens f s a = (a -> f a) -> s -> f s

x :: Functor f => Lens f Foo Int
x f s = fmap (\a -> s { _x = a}) (f(_x s))

body :: Functor f => Lens f Bar String
body f s = fmap (\a -> s { _body = a}) (f(_body s))

bar :: Functor f =>  Lens f Foo Bar
bar f s = fmap (\a -> s { _bar = a}) (f(_bar s))

(^.) :: s -> Lens (Const a) s a -> a
s ^. f =  getConst $ f Const s

(.~) :: Lens Identity s a -> a -> s -> s
f .~ a = runIdentity . f (\_ -> Identity a)
