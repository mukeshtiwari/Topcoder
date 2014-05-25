import Test.HUnit
import DigitHoles

testNumHoles :: Test
testNumHoles = TestCase 
    (assertEqual "" 0 0)

tests = TestList [ TestLabel "testNumHoles" testNumHoles ]

main = runTestTT tests
