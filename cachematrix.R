
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
  mInverse <- x$getInverse()   #checking if the inverse hase been computed before, if yes, cached values are used
  if(!is.null(mInverse)) {
    message("getting cached data")
    return(mInverse)
  }
  data <- x$getMatrix()       #If the inverse has not been computed before, the function gets the matrix from function above
  mInverse <- solve(data)     #The function computes the inverse of the matrix
  x$setInverse(mInverse)      #The inverse of the matix is stored in mInverse
  mInverse
}
