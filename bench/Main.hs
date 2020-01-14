module Main (main) where

import Criterion.Main
import Data.ByteString as BS
import Data.ByteString.Base32.Z as Base32

main :: IO ()
main = defaultMain
  [ bench "base32/encode/1M" $ nf Base32.encode
      $ BS.replicate 1000000 0x8e
  , bench "base32/encode/5M" $ nf Base32.encode
      $ BS.replicate 5000000 0x8e

  , bench "base32/decode/regular/1M" $ nf Base32.decode
      $ BS.replicate 1000000 0x41
  , bench "base32/decode/regular/5M" $ nf Base32.decode
      $ BS.replicate 5000000 0x41

  , bench "base32/decode/lenient/1M" $ nf Base32.decodeLenient
      $ BS.replicate 1000000 0x41
  , bench "base32/decode/lenient/5M" $ nf Base32.decodeLenient
      $ BS.replicate 5000000 0x41
  ]
