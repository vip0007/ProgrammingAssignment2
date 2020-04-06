## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setInv <- function(inv) m <<- inv
  getInv <- function() m
  list(set = set, get = get,
       setInv = setInv,
       getInv = getInv)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  m <- x$getInv()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  } else {
    print('creating inverse')
  }
  data <- x$get()
  m <- solve(data)
  x$setInv(m)
  m
}

#Testing example
#x <- matrix(c(4,7,2,9), nrow = 2, ncol = 2)
#x1 <- makeCacheMatrix(x)
#cacheSolve(x1)
