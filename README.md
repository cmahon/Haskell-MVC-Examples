# MVC Examples

Examples for the Haskell MVC library (only tested on OS X)

* StdInOut.hs: Simple input / output with a regular tick event (from [MVC library article][mvc-article])
* Rectangles.hs: Draw rectangles us (adpated from [MVC library article][mvc-article] using an [SDL wrapper][sdl-osx-article] for OS X)

## Setup

Tested on OS X with ghc 7.6.3 and cabal 1.20.

    git clone https://github.com/cmahon/mvc-xamples.git
    cd mvc-xamples
    cabal sandbox init
    cabal install --only-dependencies
    cabal configure
    cabal build
    cabal run stdinout
    cabal run rectangles

## Reference

* [MVC library article][mvc-article]
* [MVC library on hackage](http://hackage.haskell.org/package/mvc)
* [SDL, Haskell and OSX][sdl-osx-article]


[mvc-article]: http://www.haskellforall.com/2014/04/model-view-controller-haskell-style.html "MVC Article Link"
[sdl-osx-article]: http://www.witwenmacher.com/posts/2012-12-31-SDL-and-haskell.html "SDL OSX Article Link"