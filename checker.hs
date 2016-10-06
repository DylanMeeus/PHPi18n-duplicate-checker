-- haskell function to check for doubles
import Data.Char
import Data.List
import System.Environment
import System.IO
import Text.Regex

-- create an outputfile based on an inputfile name
outputfile i = parts !! 0 ++ "_multiples." ++ parts !! 1
    where parts = (splitRegex (mkRegex "\\.") i)

splitRgx = mkRegex "=>"

checkMultiple :: String -> [(String,Int,Int)]
checkMultiple c = filter(\(a,b,c) -> b > 1 || c > 1) (nub $ map (\x -> (x, countOccurance x xs, countOccuranceIgnoreCase x xs)) xs)
    where xs = filterKeys c

filterKeys :: String -> [String]
filterKeys ls = [(splitRegex splitRgx x)!!0 | x <- lines ls, isInfixOf "=>" x]


countOccurance :: String -> [String] -> Int
countOccurance x xs = length $ filter(\y -> y == x) xs

-- can make a tuple with three values, a triple
countOccuranceIgnoreCase :: String -> [String] -> Int
countOccuranceIgnoreCase x xs = length $ filter(\y -> map toLower y == lx) xs
    where lx = map toLower x

-- we can remove the leading spaces perhaps
printTuple :: (Show a, Show b, Show c) => (a,b,c) -> String
printTuple (a,b,c) = (splitRegex  (mkRegex "'") (show a))!!1 ++ " => " ++ (show b) ++ ",  case insensitive: " ++ (show c)

-- main function
main = do
    [i] <- getArgs
    content <- readFile i
    writeFile (outputfile i) $ intercalate "\n" (map printTuple (checkMultiple content))
-- code to write this out to a file
--
