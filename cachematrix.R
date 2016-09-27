## Caching the Inverse of a Matrix: In running what can be costly time consuming 
## computations, such as matrix inversions, it's beneficial to have the means to cache
## the results rather than repeatedly compute the inverse. 

## The following pair of functions compute and cache the inverse of a matrix by creating 
## a special object which first stores a matrix and then caches its inverse.

## The makeCacheMatrix() function produces a list containing a function to:-
## 'set' and 'get' the values of the matrix
## 'set' and 'get' the value of the inverse of the matrix.

makeCacheMatrix <- function(x = matrix()) {

}


## The cacheSolve() function computes the inverse of the matrix returned by 
## makeCacheMatrix(). It first checks if the inverse has previously been computed. If yes,
## it retrieves the result and skips the computation. If no, it then computes the inverse
## and sets the value in the cache with the setinversefunction. 

## NOTE: This function assumes the matrix is always invertible.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}


## Various test runs below

x = rbind(c(1, -1/4), c(-1/4,1))
mcm = makeCacheMatrix(x)
mcm$get()
mcm$getinverse()
cacheSolve(mcm)
cacheSolve(mcm)
solve(x) %*% x
## -----------------------
mat1 = matrix(rnorm(1000), nrow=5, ncol=5)
mcm1 = makeCacheMatrix(mat1)
mcm1$get()
mcm1$getinverse()
cacheSolve(mcm1)
cacheSolve(mcm1)
solve(mat1) %*% mat1
## -----------------------
mat2 <- matrix(1:4, 2, 2)
mcm2 = makeCacheMatrix(mat2)
mcm2$get()
mcm2$getinverse()
cacheSolve(mcm2)
cacheSolve(mcm2)
solve(mat2) %*% mat2
## -----------------------
mat3 <- matrix(c(1, 0, 1, 5, -3, 1, 2, 4, 7), nrow = 3)
mcm3 = makeCacheMatrix(mat3)
mcm3$get()
mcm3$getinverse()
cacheSolve(mcm3)
cacheSolve(mcm3)
solve(mat3) %*% mat3
## -----------------------
## NOTE: cacheSolve() Doesn't work with a singular matrix
## because determinent = 0, e.g. det(x) [1] 0 i.e. not invertible
mat4 <- matrix(1:9, nrow=3, ncol=3)   #???
mcm4 = makeCacheMatrix(mat4)
mcm4$get()
mcm4$getinverse()
cacheSolve(mcm4)
cacheSolve(mcm4)
## -----------------------
mat5 <- matrix(rnorm(16), nrow=4, ncol=4) 
mcm5 = makeCacheMatrix(mat5)
mcm5$get()
mcm5$getinverse()
cacheSolve(mcm5)
cacheSolve(mcm5)
solve(mat5) %*% mat5

