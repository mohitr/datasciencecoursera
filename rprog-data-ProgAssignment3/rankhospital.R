options(warn=-1)
rankhospital <- function(state, outcome, num = "best"){
  data <- read.csv("outcome-of-care-measures.csv", header=TRUE)
  valid_states = levels(data$State)
  valid_outcome = c("heart attack", "heart failure", "pneumonia")
  
  if (!state %in% valid_states)
    stop("invalid state")
  
  if (!outcome %in% valid_outcome)
    stop("invalid outcome")

  subset <- data[, c(2, 7, 11, 17, 23)]
  names(subset) <- c("Name", "State", valid_outcome)
  state_data <- subset[subset$State == state, ]
  state_data[[outcome]] <- as.numeric(as.character(state_data[[outcome]]))

  ##remove all NA
  state_data <- state_data[!is.na(state_data[[outcome]]), ]
  
  if (num =="best")
    num = 1
  else if(num == "worst")
    num = nrow(state_data)
  else if (num > nrow(state_data))
      return(NA)
  
  return(as.character(state_data[order(state_data[[outcome]], state_data[[1]]), ][1][num, ]))
}