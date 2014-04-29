{-# LANGUAGE ForeignFunctionInterface #-}

module Example2Main where 

import Control.Monad (join)
import Graphics.UI.SDL as SDL
import Lens.Family.Stock (_Left, _Right)  
import MVC
import MVC.Prelude
import qualified Pipes.Prelude as Pipes

foreign export ccall example2_main :: IO ()

data Done = Done deriving (Eq, Show)

sdl :: Managed (View (Either Rect Done), Controller Event)
sdl = join $ managed $ \k ->
  --withInit [InitVideo, InitEventthread] $ do
  withInit [InitEverything] $ do
    surface <- setVideoMode 640 480 32 [SWSurface]
    white   <- mapRGB (surfaceGetPixelFormat surface) 255 255 255

    let done :: View Done
        done = asSink (\Done -> SDL.quit)

        drawRect :: View Rect
        drawRect = asSink $ \rect -> do
            _ <- fillRect surface (Just rect) white
            SDL.flip surface

        totalOut :: View (Either Rect Done)
        totalOut = handles _Left drawRect <> handles _Right done

    k $ do
        totalIn <- producer Single (lift waitEvent >~ cat)
        return (totalOut, totalIn)

pipe :: Monad m => Pipe Event (Either Rect Done) m ()
pipe = do
    Pipes.takeWhile (/= Quit)
        >-> (click >~ rectangle >~ Pipes.map Left)
    yield (Right Done)

rectangle :: Monad m => Consumer' (Int, Int) m Rect
rectangle = do
    (x1, y1) <- await
    (x2, y2) <- await
    let x = min x1 x2
        y = min y1 y2
        w = abs (x1 - x2)
        h = abs (y1 - y2)
    return (Rect x y w h)

click :: Monad m => Consumer' Event m (Int, Int)
click = do
    e <- await
    case e of
        MouseButtonDown x y ButtonLeft ->
            return (fromIntegral x, fromIntegral y)
        _ -> click

example2_main :: IO ()
example2_main = runMVC () (asPipe pipe) sdl






