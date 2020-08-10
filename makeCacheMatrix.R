makeCacheMatrix <- function(x = matrix()){
  inv <- NULL
  set <- funtion(y){
    x <<- y
    inv <<- NULL
  }
  get <- function() {x}
  setInverse <- function(inverse) {inv <<- inverse}
  getInverse <- function(){inv}
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

cacheSolve <- function(x, ...){
  inv <- x$getInverse()
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)
    
  }
  matrix <- x$get()
  inv <- solve(matrix, ...)
  x$setInverse(inv)
  inv
  
}