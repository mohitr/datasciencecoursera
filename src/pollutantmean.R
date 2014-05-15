# Coursera assignment for R-programming
pollutantmean <- function(directory, pollutant, id=1:332){
    
  #empty vector
  values <- c()
  
  ## iterate over id
  for(i in id)
  {
    file_name <- sprintf("%03d", i)
    path <- paste(directory, "/", file_name, ".csv", sep="")
    ##values <- c(values, path)
    f <- read.csv(path, header=TRUE)    ## read specific file dir/filename, prefixed by 0
    values <- c(values, f[[pollutant]])
  }

  bad <- is.na(values)
  values <- values[!bad]
  return(mean(values))
}
