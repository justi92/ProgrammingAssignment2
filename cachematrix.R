## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}


#Assignment 2

## a function below creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  mInverse <- NULL
  setMatrix <- function(y) {
    x <<- y
    mInverse <<- NULL
  }
  getMatrix <- function() x
  setInverse <- function(inv) mInverse <<- inv
  getInverse <- function() mInverse
  list(setMatrix = setMatrix, 
       getMatrix = getMatrix,
       setInverse = setInverse,
       getInverse = getInverse)
}

# This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
	#If the inverse has already been calculated (and the matrix has not changed), then the 
	#cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  mInverse <- x$getInverse()
  if(!is.null(mInverse)) {
    message("getting cached data")
    return(mInverse)
  }
  data <- x$getMatrix()
  mInverse <- solve(data)
  x$setInverse(mInverse)
  mInverse
}