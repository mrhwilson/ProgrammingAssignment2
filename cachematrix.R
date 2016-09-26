## Caching the Inverse of a Matrix: In running costly time consuming computations such as 
## matrix inversion it's beneficial to have the means to cache the results rather than 
## repeatedly compute the inverse.  The following pair of functions compute and cache the
## inverse of a matrix. by creating a special object which first stores a matrix and then
## caches its inverse.

## The makeCacheMatrix() function creates a special object which first stores a matrix 
## and then caches its inverse.

makeCacheMatrix <- function(x = matrix()) {

}


## The cacheSolve() function computes the inverse of the matrix returned by 
## makeCacheMatrix(). It first checks if the inverse has previously been computed. If yes,
## it retrieves the result and skips the computation. If no, it then computes the inverse
## and sets the value in the cache with the setinversefunction. 
NOTE: This function assumes the matrix is always invertible.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

