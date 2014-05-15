# Coursera assignment for R-programming
complete <- function(directory, id = 1:332){
  
  ids <- c()
  nobs <- c()
  
  for(i in id)
  {
    file_name <- sprintf("%03d", i)
    path <- paste(directory, "/", file_name, ".csv", sep="")
    ##values <- c(values, path)
    f <- read.csv(path, header=TRUE)    ## read specific file dir/filename, prefixed by 0
    good_rows <- complete.cases(f)
    
    ids <- c(ids, i)
    nobs <- c(nobs, nrow(f[good_rows,]))
  }

  id <- ids
  return(data.frame(ids, nobs))
}
  
