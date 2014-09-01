import Control.Applicative ((<$>), (<*>))
import Control.Foldl (last, length)
import MVC
import MVC.Updates
import MVC.Prelude (stdinLines, tick)
import qualified Pipes.Prelude as Pipes (takeWhile)
import Prelude hiding (last, length)

lastLine :: Updatable (Maybe String)
lastLine = On last stdinLines

seconds :: Updatable Int
seconds = On length (tick 1.0)

data Example = Example (Maybe String) Int deriving (Show)

example :: Updatable Example
example = Example <$> lastLine <*> seconds

viewController :: Managed (View Example, Controller Example)
viewController = do
    controller <- updates Unbounded example
    return (asSink print, controller)

model :: Model () Example Example
model = asPipe $
    Pipes.takeWhile (\(Example str _) -> str /= Just "quit")

main :: IO ()
main = runMVC () model viewController