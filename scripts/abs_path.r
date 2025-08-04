
# Author: Aldair Leon.                      
# Lecture: Applied Statistics in R    
# Date: 20225-08-04
# Description: Return absolute path to a data set in the "data" directory.

# Install and load the logger package
library(logger)

path_data <-  function(data_set_name) {
# Verify data set path
full_path <- file.path("data", data_set_name)
tryCatch({
  file_path <- normalizePath(full_path, mustWork = TRUE)
  return(file_path)
}, error = function(e) {
    log_error(paste(e$message))
    return(NULL)
}) 
}

path_scripts <- function() {
tryCatch({
  file_path <- normalizePath("code", mustWork = TRUE)
  return(file_path)
}, error = function(e) {
    log_error(paste(e$message))
    return(NULL)
}) 
}
