# Erythrina

Erythrina is a simple tool that allows for quick selection from a list
of options with instant feedback. It's inspired largely by Emacs's
[ido-mode](http://www.emacswiki.org/emacs/InteractivelyDoThings) and
[dmenu](http://tools.suckless.org/dmenu/). I wrote it because I was
frustrated that dmenu did not support fuzzy matching. Erythrina
currently treats space as a wildcard, so "er th ml" will match
"erythina.ml".

## Usage

    $ echo "elisp
    > ocaml
    > javascript
    > clojure
    > ruby" | erythrina
    
    # pops up a window showing completions with feedback
    
    ocaml # outputs whichever option was chosen by ENTER

## Todo

* Allow cycling of options
* Tab completion
* Order by historical usage
* Custom colors
* Change font

## License

Copyright © 2011 Phil Hagelberg

Distributed under the GNU General Public License version 3. See COPYING.
