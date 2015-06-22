corr <- function(directory, threshold = 0) {
	readPollutantCsv <- function(directory, id) {

    read.csv(paste(directory, "/", sprintf("%03d", id), ".csv", sep=''))

}
	source("complete.R")
	com <- complete(directory)
	data <- com[com$nobs > threshold, ]
	result <- numeric(0)
	for(id in data$id) {
		csv <- readPollutantCsv(directory, id)
		tf <- !is.na(csv$sulfate) & !is.na(csv$nitrate)
		x <- csv[tf, ]
		result <- c(result, cor(x$sulfate, x$nitrate))
	}
	result
}
