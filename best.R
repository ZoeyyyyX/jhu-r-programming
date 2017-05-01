best <- function(state, outcome){
        data <- read.csv("/Users/xiaozihan/Downloads/ProgAssignment3-data/outcome-of-care-measures.csv", 
                         header = TRUE, sep = ",", colClasses = "character")
        data1 <- data.frame()
        data2 <- data.frame()
        outcomes <- c("heart attack", "heart.failure", "pneumonia")
        states <- as.character(unique(data$State))
        if (!any(state == states)){
                stop("invalid state")
        }
        else if (outcome == "heart attack"){
                m <- 11
        }
        else if (outcome == "heart failure"){
                m <- 17
        }
        else if (outcome == "pneumonia"){
                m <- 23
        }
        else {
                stop("invalid outcome")  
        }
        data1 <- data[which(data[, "State"] == state), ]
        data2 <- data1[, c(2, m)]
        data2[, 2] <- as.numeric(data2[, 2])
        i <- order(data2[, 2])
        n <- i[1]
        return(data2[n, 1])
}