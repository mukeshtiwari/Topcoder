import Test.HUnit
import NumbersChallenge

testMinNumber :: Test
testMinNumber = TestCase 
    (assertEqual "" 0 0)

tests = TestList [ TestLabel "testMinNumber" testMinNumber ]

main = runTestTT tests
