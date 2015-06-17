complete <- function(directory, id = 1:332) {
	files_list <- list.files(directory, full.names=TRUE)
	nob_df <- data.frame(id=numeric(), nobs=numeric())
	for(i in id){
		read_files <- read.csv(files_list[i])
		nobs <- sum(complete.cases(read_files))
		nob_df <- rbind(nob_df, data.frame(id= i, nobs))
	}
	nob_df
}
	
	