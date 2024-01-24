library(ggplot2)
setwd("C:\\Desktop\\For_R2\\preGSE165914")
countData <- read.csv(file="DEGs_edger_2vs1_ori.csv", sep=",")

# Create a new variable for condition labels
countData$ConditionLabel <- ifelse(countData$logFC > 1 & countData$PValue < 0.05, "Upregulated",
                                   ifelse(countData$logFC < -1 & countData$PValue < 0.05, "Downregulated", "Not Significant"))

# Define specific colors for each condition
colors <- c("Upregulated" = "red", "Downregulated" = "blue", "Not Significant" = "black")

volcano_plot <- ggplot(countData, aes(x = logFC, y = -log10(PValue))) +
  geom_point(aes(color = ConditionLabel), size = 1) +
  scale_color_manual(values = colors) +  # Set manual colors
  labs(x = "LogFC",
       y = "-log10(PValue)",
       title = "(b) GSE165914") +
  theme_minimal()

volcano_plot  # Display the volcano plot
