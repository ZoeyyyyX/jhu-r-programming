rankall <- function(outcome, num = "best"){
        data <- read.csv("/Users/xiaozihan/Downloads/ProgAssignment3-data/outcome-of-care-measures.csv", 
                         header = TRUE, sep = ",", colClasses = "character")
        data1 <- data.frame()
        data2 <- data.frame()
        data3 <- data.frame()
        outcomes <- c("heart attack", "heart.failure", "pneumonia")
        states <- as.character(unique(data$State))
        if (outcome == "heart attack"){
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
        if (num == "best"){
                num <- 1
        }
        else if (num == "worst"){
                num <- length((i))
        }
        data1 <- data[, c(2, 7, m)]
        data1[, 3] <- as.numeric(data1[, 3])
        data2 <- split(data1, data1$State)
        for (i in 1 : length(unique(data1$State))){
                l <- order(data2[[i]][, 3])
                if (num <= length(l)){
                        data3 <- rbind(data3, data2[[i]][l[num], c(1, 2)])
                }
                if (num > length(l)){
                        data3 <- rbind(data3, 
                }
                
        }
        data3
}