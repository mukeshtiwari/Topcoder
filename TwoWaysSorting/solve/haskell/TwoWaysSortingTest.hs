import Test.HUnit
import TwoWaysSorting

testSortingMethod :: Test
testSortingMethod = TestCase 
    (assertEqual "" 0 0)

tests = TestList [ TestLabel "testSortingMethod" testSortingMethod ]

main = runTestTT tests
