## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {  # set function is used to initialize the matrix and its inverse
    x <<- y
    m <<- NULL
  }
  get <- function() x   #returns the original matrix
  setInv <- function(inv) m <<- inv  #caches the inverse of the matrix
  getInv <- function() m  # returns the inverse of matrix
  list(set = set, get = get,
       setInv = setInv,
       getInv = getInv)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  m <- x$getInv()   #getting the cached inverse, if present
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  } else {
    print('creating inverse')
  }
  data <- x$get() #getting the matrix to calculate the inverse
  m <- solve(data) 
  x$setInv(m)
  m
}

#Testing example
#x <- matrix(c(4,7,2,9), nrow = 2, ncol = 2)
#x1 <- makeCacheMatrix(x)
#cacheSolve(x1)
03fce81e594a27b2929195590f974c694cfaa0cd
