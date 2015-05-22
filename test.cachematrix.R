##     This script contains test code for the functions in cacheM
##     Run below lines interactively to validate sourced functions
##     with a 4x4 square matrix (test.mx)
##     executes funtions for the following
##  1. test and baseline capability to return inverse of square matrix
##  2. test behavior of makeCacheMatrix functions to cache and return a matrix
##  3. test ability to solve, store and retrieve the inverse matrix
##  4. test overwrite of matrix, and compare re-inverted matrix with original

source("cachematrix.R")

## 1.  builds the test matrix and shows default solve() function
message("generating test matrix...")
test <- c(9, 1, 3, 6, 13, 11, 7, 0, 5, 7, 4, 7, 2, 6, 1, 10)
test.mx <- matrix(test,4,4)
print(test.mx)
message("checking to see what inverse should look like...")
test.solve <- solve(test.mx)
print(test.solve)

## 2. passes test matrix to into test object
##    (from - http://en.wikipedia.org/wiki/Square_matrix)
##    along with atomic caching functions
##    shows that matrix is cached after $setmx
##    is explicitly called on test matrix
message("passing test matrix to makeCacheMatrix...")
test.functs <- makeCacheMatrix(test.mx)
test.functs$setmx(test.mx)
message("and checking if it can retrieve matrix from cache...")
test.mxret <- test.functs$getmx()
print(test.mxret)


## 3. tests cacheSolve function with test object
##    should return the inverted matrix of the test matrix
##    then should return the same matrix values from cache
message("solving for inverse matrix and storing values...")
cacheSolve(test.functs)
message("and checking to see if inverse matrix is stored in cache...")
message("")
cacheSolve(test.functs)

## 4. passes back the cached inverted matrix to the $setmx, $getmx,
##    and cacheSolve functions to produce the original test matrix
##    final result should appear like very close to original matrix
test.inv <- test.functs$getinv()
print(test.inv)
test.functs$setmx(test.inv)
test.inv2 <- cacheSolve(test.functs)
message("comparing reinverted matrix with original...")
print(test.inv2)
print(test.mx)
if(test.inv2[4,4] == test.mx[4,4]) print("Success") else print("Unsuccessful")
message(" Note: Values vary slightly from test.mx due to precision of solve()")

##    Clean up objects created during test execution
rm(test, test.functs, test.inv, test.inv2, test.mx, test.solve, test.mxret)
##    End of test routines.  Review the execution, and debug if necessary
