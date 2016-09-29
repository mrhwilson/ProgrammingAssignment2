## Caching the Inverse of a Matrix: In running what can be costly time consuming 
## computations, such as matrix inversions, it's beneficial to have the means to cache
## the results rather than repeatedly compute the inverse. 

## The following pair of functions compute and cache the inverse of a matrix by creating 
## a special object which first stores a matrix and then caches its inverse.

## The makeCacheMatrix() function produces a list containing a function to:-
## 'set' and 'get' the values of the matrix
## 'set' and 'get' the value of the inverse of the matrix.

makeCacheMatrix <- function(x = matrix()) {
        minv<- NULL
        set <- function(y) {
                x <<- y       
                minv<<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) minv<<- inverse
        getinverse <- function() minv
        list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}

## The cacheSolve() function computes the inverse of the matrix returned by 
## makeCacheMatrix(). It first checks if the inverse has previously been computed. If yes,
## it retrieves the result and skips the computation. If no, it then computes the inverse
## and sets the value in the cache with the setinversefunction. 

## NOTE: This function assumes the matrix is always invertible.
## Return a matrix that is the inverse of 'x'

cacheSolve <- function(x, ...) {
        minv<- x$getinverse()
        if(!is.null(minv)) {
                message("getting cached data.")
                return(minv)
        }
        # calculate the inverse
        mdata <- x$get()
        minv<- solve(mdata)
        x$setinverse(minv)
        minv
}

## Various test runs below

test1 <- rbind(c(1, 3), c(-3,1))
mcm = makeCacheMatrix(test1)
mcm$get()
mcm$getinverse()
cacheSolve(mcm)
cacheSolve(mcm)
solve(test1) %*% test1
## -----------------------
test2 <- matrix(rnorm(1000), nrow=5, ncol=5)
mcm1 = makeCacheMatrix(test2)
mcm1$get()
mcm1$getinverse()
cacheSolve(mcm1)
cacheSolve(mcm1)
solve(test2) %*% test2
## -----------------------
test3 <- matrix(1:4, 2, 2)
mcm2 = makeCacheMatrix(test3)
mcm2$get()
mcm2$getinverse()
cacheSolve(mcm2)
cacheSolve(mcm2)
solve(test3) %*% test3
## -----------------------
test4 <- matrix(c(1, 0, 1, 5, -3, 1, 2, 4, 7), nrow = 3)
mcm3 = makeCacheMatrix(test4)
mcm3$get()
mcm3$getinverse()
cacheSolve(mcm3)
cacheSolve(mcm3)
solve(test4) %*% test4
## -----------------------
## NOTE: cacheSolve() Doesn't work with a singular matrix
## because determinent = 0, e.g. det(x) [1] 0 i.e. not invertible
test5 <- matrix(1:9, nrow=3, ncol=3)  
mcm4 = makeCacheMatrix(test5)
mcm4$get()
mcm4$getinverse()
cacheSolve(mcm4)
cacheSolve(mcm4)
## -----------------------
test6 <- matrix(rnorm(16), nrow=4, ncol=4) 
mcm5 = makeCacheMatrix(test6)
mcm5$get()
mcm5$getinverse()
cacheSolve(mcm5)
cacheSolve(mcm5)
solve(test6) %*% test6

