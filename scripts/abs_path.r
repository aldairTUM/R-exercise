
"
  The followwing script create a absolute path of the dataset
  Author: Aldair Leon

"


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