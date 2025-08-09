# Author: Aldair Leon.                      
# Lecture: Applied Statistics in R    
# Date: 202xx -xx-xx
# Description: Ensure all required libraries are installed and loaded.

install_libraries <- function() {
  libs <- c("logger", "dplyr", "ggplot2","shiny","psych","tidyverse","caret","broom","gridExtra","glmnet","astsa","forecast","knitr","kableExtra") # Add other libraries as needed
  for (lib in libs) {
    if (!require(lib, character.only = TRUE, quietly = TRUE)) {
      install.packages(lib)
      library(lib, character.only = TRUE)
    }
  }
    library(logger)
    log_info("All libraries installed and loaded successfully.")
}