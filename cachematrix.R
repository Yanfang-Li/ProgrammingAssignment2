## Assignment: Caching the Inverse of a Matrix

## This function creates a special "matrix" object that can cache its inverse
# It creates a list containing a function to
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of inverse of the matrix
# 4. get the value of inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
        invx <- NULL
        set <- function(y){
                x <<- y
                invx <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) invx <<- inverse
        getinverse <- function() invx
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), then the 
## cachesolve should retrieve the inverse from the cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        invx <- x$getinverse()
        if(!is.null(invx)){
                message("getting caches data")
                return(invx)
        }
        mat <- x$get()
        invx <- solve(mat, ...)
        x$setinverse(invx)
        invx
}
