## The functions below will calculate and store the inverse of a matrix.
## It will return the stored value if the inverse has already been calcaluted to reduce
## processing time.

## The function below does the following:
## 1. Sets the value of a matrix
## 2. Gets the value of a matrix
## 3. Sets the value of the inverse matrix
## 4. Gets the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
        i<-NULL                                 ## Initialize Free variable
        
        #Assign Value to Matrix
        set <- function(y){
                x <<- y
                i <<- NULL
        }
        
        #Print Matrix
        get <- function(){
                x
        }
        
        #Store inverse to Cache
        setinv <- function(inv){
                i <<- inv
        }
        
        #Print Inverse
        getinv <- function(){
                i
        }
        
        #Index functions as list
        list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## The function below calculates the inverse of a matrix, stores the inverse in the cache 
## and retrieves the stored inverse to reduce processing time.

cacheSolve <- function(x, ...) {
       
        i <- x$getinv()                             # Get current value of i
        
        #Check if the inverse is stored in the cache
        
        if (!is.null(i)){
                message("Getting Cached Inverse")
                return(i)
        }
        
        data <- x$get()                      #Get the value of 'x' and assign it to 'data'
        i <- solve(data, ...)                # Calculate the inverse of the matrix
        x$setinv(i)                          # Store the value of inverse in 'i'
        i                                    #Return 'i'
}
