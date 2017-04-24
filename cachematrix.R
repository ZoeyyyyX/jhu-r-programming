## This function is used to help us calculating the inverse of matrixs.
## If we calculate a matrix at first time, the result will be cached
## and if we want to calculate the same matrix at the next time, R will
## return to the result we calculate before. If there is a new matrix
## needing calculating, R will calculate the inverse of this new matrix.

## makeCacheMatrix create two variable "x" and "m" where x represents
## matrixes and m cache the inversing results. This function calculates
## the inverse of matrixes and returns lists containing x and the inverse 
## of x as well as store the result in variable "m"

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y){
                x <<- y
                m <<- NULL
        }
        get <- function()x
        setinverse <- function(solve) m <<- solve
        getinverse <- function() m
        list(set = set,
             get = get,
             setinverse = setinverse,
             getinverse = getinverse)

}


## cacheSolve calculate the inverse of matrix. If the matrix has been
## calculate before than R will return to the result in cache. Or R
## will calculate the matrix as usual

cacheSolve <- function(x, ...) {
        m <- x$getinverse()
        if (!is.null(m)){
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        ## Return a matrix that is the inverse of 'x'
        x$setinverse(m)
        m
}
