# MVC Examples

Examples for the Haskell MVC library

* ConsoleInOut.hs: Simple input / output with a regular tick event (from [MVC library article][mvc-article])
* RectanglesMain.hs: Draw rectangles (adpated from [MVC library article][mvc-article] using an [SDL wrapper for OS X][sdl-osx-article])
* FlappyMain.hs: Animate flapping bird around cursor (adpated from [MVC updates article][mvc-updates-article] using an [SDL wrapper for OS X][sdl-osx-article])
* SpreadsheetMain.hs: basic spreadsheet (adpated from [MVC updates article][mvc-updates-article])

## Setup

Tested on OS X with ghc 7.6.3 and cabal 1.20.

    git clone https://github.com/cmahon/mvc-examples.git
    cd mvc-examples
    cabal sandbox init
    export PKG_CONFIG_PATH=/usr/X11/lib/pkgconfig
    cabal install gtk2hs-buildtools
    cabal install gtk --with-gcc=gcc-4.8 --extra-lib-dirs=/usr/local/Cellar/gettext/0.18.3.1/lib
    cabal install --only-dependencies
    cabal configure
    cabal build
    cabal install
    cabal run consoleinout
    cabal run rectangles

## Reference

* [MVC library article][mvc-article]
* [MVC Updates article][mvc-updates-article]
* [MVC library on hackage](http://hackage.haskell.org/package/mvc)
* [MVC updates examples repo](https://github.com/Gabriel439/Haskell-MVC-Updates-Examples-Library)
* [SDL, Haskell and OSX][sdl-osx-article]


[mvc-article]: http://www.haskellforall.com/2014/04/model-view-controller-haskell-style.html "MVC Article Link"
[mvc-updates-article]: http://www.haskellforall.com/2014/06/spreadsheet-like-programming-in-haskell.html "MVC Updates Article Link"
[sdl-osx-article]: http://www.witwenmacher.com/posts/2012-12-31-SDL-and-haskell.html "SDL OSX Article Link"