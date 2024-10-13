import Test.Hspec
import Test.Tasty
import Test.Tasty.Hspec
import Test.Tasty.QuickCheck

main :: IO ()
main = do
  spec <- testSpec "Prelude spec" preludeSpec
  defaultMain $ testGroup "Tests" [properties, spec]

properties :: TestTree
properties = testGroup "Properties" [qcProps]

qcProps :: TestTree
qcProps =
  testGroup
    "(checked by QuickCheck)"
    [ testProperty
        "addition is commutative "
        additionIsCommutative
    ]

-- QuickCheck property
additionIsCommutative :: Int -> Int -> Bool
additionIsCommutative a b = a + b == b + a

-- Hspec specification
preludeSpec :: Spec
preludeSpec = describe "Prelude.head" $ do
  it "returns the first element of a list" $ do
    head [23 ..] `shouldBe` (23 :: Int)
