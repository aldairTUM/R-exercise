# Author: Aldair Leon.                      
# Lecture: Applied Statistics in R    
# Date: 20225-08-04
# Description: Exercise #1

source('scripts/abs_path.r', chdir = TRUE)
source('scripts/install_libraries.r', chdir = TRUE)


# Installing missing libraries
install_libraries()

# Reading a CSV file
wine <- read.csv(path_data('winequality-white.csv'), sep=";")
wine[] <- lapply(wine, as.numeric)
wine$quality_binary <- ifelse(wine$quality > 5, 1, 0)

# Adding binary variable
good_wines <- wine[wine$quality_binary == 1, ]
bad_wines <- wine[wine$quality_binary == 0, ]

# Histogram for Good and Bad Wine
hist(good_wines$residual.sugar)
hist(bad_wines$residual.sugar, main = "Wine Quality Histogram", xlab = "Quality", col = "lightblue")
library(ggplot2)
ggplot(good_wines, aes(x = residual.sugar)) + geom_histogram(binwidth = 1, fill = "skyblue", color = "black")
ggplot(bad_wines, aes(x = residual.sugar)) + geom_histogram(binwidth = 1, fill = "lightcoral", color = "black")

summary(good_wines$residual.sugar)
summary(bad_wines$residual.sugar)

library(psych)
good_wines_summary <- describe(good_wines$residual.sugar)
good_wines_summary <- describe(bad_wines$residual.sugar)

good_bad_wines <- data.frame(
    value = c(good_wines$residual.sugar, bad_wines$residual.sugar),
    group = factor(c(rep("Good wines", length(good_wines$residual.sugar)), rep("Bad Wines", length(bad_wines$residual.sugar)))
)
)

ggplot(good_bad_wines, aes(x = group, y = value, fill = group)) +
  geom_boxplot() +
  labs(title = "Box Plot of Good and Bad wines", x = "Group", y = "Value") +
  theme_minimal()

ggplot(good_wines, aes(sample = residual.sugar)) +
  stat_qq() +
  stat_qq_line(color = "blue") +
  labs(title = "Q-Q Plot Good wine", x = "Theoretical Quantiles", y = "Sample Quantiles") +
  theme_minimal()

ggplot(bad_wines, aes(sample = residual.sugar)) +
  stat_qq() +
  stat_qq_line(color = "blue") +
  labs(title = "Q-Q Plot Bad wine", x = "Theoretical Quantiles", y = "Sample Quantiles") +
  theme_minimal()

ggplot(good_bad_wines, aes(x = value, color = group)) +
  stat_ecdf(geom = "step", size = 1.2) +
  labs(title = "Sample distribution", x = "Value", y = "ECDF") +
  coord_cartesian(xlim = c(1, 7), ylim = c(0.2, 0.8)) + 
  theme_minimal()
