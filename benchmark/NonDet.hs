{-# LANGUAGE TypeApplications #-}
module NonDet
( benchmark
) where

import qualified Control.Carrier.NonDet.Church as NonDet.Church
import           Control.Carrier.Pure
import           Gauge hiding (benchmark)
import qualified NonDet.NQueens as NQueens

benchmark :: Gauge.Benchmark
benchmark = bgroup "NonDet"
  [ bgroup "N-queens problem"
    [ NQueens.benchmark "NonDet.Church" (run . NonDet.Church.runNonDetA)
    , NQueens.benchmark "[]"            (id @[_])
    ]
  ]
