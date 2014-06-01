options(warn=-1)
best <- function(state, outcome){
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
  return(as.character(state_data[order(state_data[[outcome]], state_data[[1]]), ][1][1, ]))
}