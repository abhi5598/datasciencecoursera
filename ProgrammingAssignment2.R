#This function creates a special "matrix" object that can cache its inverse.

# set the value of the matrix
# get the value of the matrix
# set the value of the Inverse matrix
# get the value of the Inverse matrix
makeCacheMatrix  <- function(x = matrix()) {
        invx <- NULL
        set <- function(y) {
                x <<- y
                invx <<- NULL
        }
        get <- function() x
        setinv <- function(inv)
                invx <<- inv
        getinv <- function()
                invx
        list(
                set = set,
                get = get,
                setinv = setinv,
                getinv = getinv
        )
}
#his function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

cacheSolve  <- function(x, ...) {
        invx <- x$getinv()
        if (!is.null(invx)) {
                message("getting cached data")
                return(invx)
        }
        data <- x$get()
        invx <- solve(data)
        x$setinv(invx)
        invx
}

#cacheSolve(makeCacheMatrix(rbind(c(2, 4), c(4, 2))))
