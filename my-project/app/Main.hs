{-# LANGUAGE OverloadedStrings #-}

module Main where

import Lib

import Database.MySQL.Base
import qualified System.IO.Streams as Streams

main :: IO ()
main = do
    someFunc

    conn <- connect
        defaultConnectInfo {ciUser = "root", ciPassword = "password", ciDatabase = "test"}
    (defs, is) <- query_ conn "SELECT comment FROM test where id=2;"
    print =<< Streams.toList is

    
    print (is :: 0)
