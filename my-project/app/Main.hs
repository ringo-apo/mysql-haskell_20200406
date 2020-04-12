{-# LANGUAGE OverloadedStrings #-}

module Main where

import Lib

import Database.MySQL.Base
import qualified System.IO.Streams as Streams
import qualified Data.Text as T
import qualified Data.Text.IO as T

syori text = do
    let a = text
    let b = a ++ "aa"
    print b


main :: IO ()
main = do
--    someFunc

    conn <- connect
        defaultConnectInfo {ciUser = "root", ciPassword = "password", ciDatabase = "test"}
    (defs, is) <- query_ conn "SELECT comment FROM test where id=2;"
--    print =<< Streams.toList is

    mapM_ (mapM_ f) =<< Streams.toList is
        where
            f :: MySQLValue -> IO ()
            f (MySQLText text) = T.putStrLn text
            f _other = return ()
