# Coursera assignment for R-programming
corr <- function(directory, threshold = 0)
{
  corrs = c()
  for(i in 1:332){
    file_name <- sprintf("%03d", i)
    path <- paste(directory, "/", file_name, ".csv", sep="")
    ##values <- c(values, path)
    f <- read.csv(path, header=TRUE)    ## read specific file dir/filename, prefixed by 0
    good <- f[complete.cases(f),]
    if(nrow(good) > threshold){
      c <- cor(good$sulfate, good$nitrate)
      corrs <- c(corrs, c)
    }    
  }
  
  return(corrs)
}
