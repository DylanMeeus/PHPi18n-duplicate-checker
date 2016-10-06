# PHPi18n-duplicate-checker
Checks for duplicate keys in the PHP i18n language files. Written in Haskell. 

To use, compile with ghc --make -O2 checker.hs
next run: ./checker [languagefile.php]

it will output a file with the same name as the input, but with the postfix _multiples_ added to it.
Extension remains the same

** MacOS does sometimes give issues related to Encoding **
** Not tested under Windows **
