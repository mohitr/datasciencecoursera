options(warn=-1)

rankall <- function(outcome, num = "best"){
  data <- read.csv("outcome-of-care-measures.csv", header=TRUE)
  valid_states = levels(data$State)
  valid_outcome = c("heart attack", "heart failure", "pneumonia")
  
  if (!state %in% valid_states)
    stop("invalid state")
  
  if (!outcome %in% valid_outcome)
    stop("invalid outcome")
  
  subset <- data[, c(2, 7, 11, 17, 23)]
  names(subset) <- c("Name", "State", valid_outcome)
  
  a <- split(subset, subset$State)
  
  sorted = lapply(a, function(d){
    
    ##remove all NA
    bar <- d[[outcome]] != "Not Available"
    d <- d[bar, ]
    
    ##convert to numeric
    d[[outcome]] <- as.numeric(as.character(d[[outcome]]))
    
    if(num == "best")
      foo = 1
    else if(num == "worst")
      foo = nrow(d)
    else if (num > nrow(d))
      return(NA)
    else
      foo = num
    
    return(as.character(d[order(d[[outcome]], d[[1]]), ][1][foo, ]))
  })
  
  d <- data.frame(cbind(sorted[names(sorted)], names(sorted)))
  names(d) <- c("hospital", "state")
  return(d)
}