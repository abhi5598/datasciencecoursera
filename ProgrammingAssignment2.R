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
#The following function calculates the mean of the special "vector" created with the above function. However, it first checks to see if the mean has already been calculated. If so, it gets the mean from the cache and skips the computation. Otherwise, it calculates the mean of the data and sets the value of the mean in the cache via the setmean function.

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