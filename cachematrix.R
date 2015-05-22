## This script contains functions for caching and retrieving the values of a
## stored matrix as well as caching and retreiving the inverse of a stored
## invertible square matrix.

## This first function contains storage and retrieval functions for the
## matrix to be inverted, as well as the associated inverted matrix.

makeCacheMatrix <- function(x = matrix()) {

    ## clear the inverse matrix cache by default
    mx.inv <- NULL

    ## sub-function for storing a matrix and clearing cache for inverse matrix
    setmx <- function(y) {
        mx <<- y
        mx.inv <<- NULL
    }

    ## sub-function for retrieving the matrix from cache
    getmx <- function() mx

    ## sub-function for storing the inverse matrix
    setinv <- function(solve) mx.inv <<- solve

    ## sub-function for retrieving the inverse matrix
    getinv <- function() mx.inv

    ## list of sub-functions that may be called from this function
    list(setmx = setmx, getmx = getmx,
         setinv = setinv, getinv = getinv)
}


## This second function calculates the inverse matrix only if provided an
## invertible square matrix when the matrix has been stored previously
## if previously calculated, the function will retrieve the inverted matrix
## from cached values instead of recalculating.

cacheSolve <- function(x, ...) {

    ## attempt to retrieve the inverse matrix from cache
    mx.inv <- x$getinv()

    ## determine if inverse matrix was successfully retrieved from cache
    if(!is.null(mx.inv)) {
        message("getting cached data...")

        ## Return a matrix that is the inverse of 'x'
        return(mx.inv)

    ## otherwise, calculate the inverse matrix and store the value in cache
    } else {

        ## retrieve the matrix from cache
        mx <- x$getmx()

        ## calculate the inverse matrix
        mx.inv <- solve(mx)

        ## store the inverse matrix in cache
        x$setinv(mx.inv)

        ## Return a matrix that is the inverse of 'x'
        mx.inv
    }
}

## Testcode: interactive code for testing above functions in test.cachematrix.R
