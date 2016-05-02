## The functions below will calculate and store the inverse of a matrix.
## It will return the stored value if the inverse has already been calcaluted to reduce
## processing time.

## The function below does the following:
## 1. Sets the value of a matrix
## 2. Gets the value of a matrix
## 3. Sets the value of the inverse matrix
## 4. Gets the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
        i<-NULL
        set <- function(y){
                x <<- y
                i <<- NULL
        }
        get <- function(){
                x
        }
        setinv <- function(inv){
                i <<- inv
        }
        getinv <- function(){
                i
        }
        list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## The function below calculates the inverse of a matrix, stores the inverse in the cache 
## and retrieves the stored inverse to reduce processing time.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i <- x$getinv()
        if (!is.null(i)){
                message("Getting Cached Inverse")
                return(i)
        }
        data <- x$get()
        i <- solve(data, ...)
        x$setinv(i)
        i
}
