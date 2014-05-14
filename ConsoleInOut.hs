import MVC
import qualified MVC.Prelude as MVC
import qualified Pipes.Prelude as Pipes

external :: Managed (View String, Controller String)
external = do
    c1 <- MVC.stdinLines
    c2 <- MVC.tick 1
    return (MVC.stdoutLines, c1 <> fmap show c2)

model :: Model () String String
model = asPipe (Pipes.takeWhile (/= "quit"))

main :: IO ()
main = runMVC () model external

