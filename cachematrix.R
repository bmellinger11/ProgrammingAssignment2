## This script contains functions for caching and retreiving the values of a
## stored matrix as well as caching and retreiving the inverse of a stored
## invertible square matrix.

## This first function contains storage and retreival functions for the
## matrix to be inverted, as well as the associated inverted matrix

makeCacheMatrix <- function(x = matrix()) {
    mx.inv <- NULL
    setmx <- function(y) {
        mx <<- y
        mx.inv <<- NULL
    }
    getmx <- function() mx
    setinv <- function(solve) mx.inv <<- solve
    getinv <- function() mx.inv
    list(setmx = setmx, getmx = getmx,
         setinv = setinv, getinv = getinv)
}


## This second function calculates the inverse matrix only if provided an
## invertible square matrix when the matrix has been stored previously
## if previously calculated, the function will retreive the inverted matrix
## from cached values instead of recalculating

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    mx.inv <- x$getinv()
    if(!is.null(mx.inv)) {
        message("getting cached data...")
        return(mx.inv)
    } else {
        mx <- x$getmx()
        mx.inv <- solve(mx)
        x$setinv(mx.inv)
        mx.inv
    }
}

## Testcode: interactive code for testing above functions in test.cachematrix.R
