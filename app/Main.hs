import Lib (someFunc)

main :: IO ()
main = do
  someFunc
  putStrLn "hello, from `main`"
