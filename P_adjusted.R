# Load the DEGs file
data1 <- read.csv("Raw_2 meta_sig_genes_metap (2) - Copy.csv")

# Apply BH correction on p-values in the 4th column
data1$adj.P.Val <- p.adjust(data1[,4], method = "BH")

# Save the updated DEGs table
write.table(data1, file = "New_adjusted.csv", sep = ",", row.names = FALSE, quote = FALSE)

# View the updated DEGs table with adjusted p-values
head(data1)
