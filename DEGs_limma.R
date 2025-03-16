# Load necessary libraries
library(limma)  
library(ggplot2)
# Load metadata (assuming first column is sample names)
meta_data <- read.csv("Meta_data.csv", header = TRUE, row.names = 1, stringsAsFactors = TRUE)

# Load normalized expression matrix (rows: genes, columns: samples)
exp_data <- read.csv("cleaned_file - Copy.csv", header = TRUE, row.names = 1)

# Create factor variable for group (Control vs Cancerous)
group <- factor(meta_data$Group, levels = c("Control", "Cancerous"))  

# Create design matrix
design <- model.matrix(~0 + group)  
colnames(design) <- c("Control", "Cancerous")  

print(design)  # Check design matrix

# Fit the linear model
fit <- lmFit(exp_data, design)  

# Define contrast matrix (Cancerous - Control)
contrast.matrix <- makeContrasts(Cancerous - Control, levels = design)  

# Apply contrast matrix
fit2 <- contrasts.fit(fit, contrast.matrix)  

# Empirical Bayes moderation
fit2 <- eBayes(fit2)  

# Get top differentially expressed genes
deg_results <- topTable(fit2, adjust.method = "BH", sort.by = "P", number = Inf)  

# Save DEGs to CSV file
write.csv(deg_results, file = "All_DEGs_Limma_Cancerous_vs_Control.csv", row.names = TRUE)

