complete <- function(directory, id = 1:332){
        files_full <- list.files(directory, full.names = TRUE)
        dat <- data.frame()
        nobs <- data.frame()
        for (i in id){
                nobs <- sum(complete.cases(read.csv(files_full[i], header = TRUE, sep = ",")))
                dat <- rbind(dat, data.frame(i, nobs))
        }
        dat
}
corr <- function(directory, threshold = 0) 
{
        
        dat2 <- complete(directory)
        abovethresh <- dat2[dat2$nobs > threshold,1]
        files_list <- list.files(path = directory, full.names = TRUE)
        correlation <- rep(NA,length(abovethresh))
        
        for (i in abovethresh) 
        {
                data <- (read.csv(files_list[i]))
                dat2 <- complete.cases(data)
                sulfatedata <- data[dat2, 2]
                nitratedata <- data[dat2, 3]
                correlation[i] <- cor(x = sulfatedata, y = nitratedata)
        }
        correlation <- correlation[complete.cases(correlation)]
}

