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