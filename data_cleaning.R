library(dplyr)
data <- read.csv("normalized_expression_data.csv", stringsAsFactors = FALSE)
data <- data[!is.na(df[,1]), ] # remove Values with NA


data_cleaned <- data %>%
  group_by(GeneSymbol) %>%
  summarise(across(where(is.numeric), mean, na.rm = TRUE)) #gives the mean value s of duplicates

write.csv(data_cleaned, "cleaned_file.csv", row.names = FALSE)


