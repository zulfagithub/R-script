# EdgeR Script for computing DEGs. 
library(edgeR)
setwd("C:\\Desktop\\For_R2\\GSE117765")
data <- read.csv("GSE117765.csv")
group <- factor(c(1,1,2,2,2,2))
dge <- DGEList(counts=data,group=group)
keep <- filterByExpr(dge)
dge <- dge[keep,,keep.lib.sizes=FALSE]
dge <- calcNormFactors(dge, method = "TMM")
design <- model.matrix(~group)
design
dge <- estimateDisp(dge,design)
fit <- glmFit(dge,design)
lrt <- glmLRT(fit,coef=2)
lrt <- exactTest(object = dge)
lrt
topTags(lrt)
topGenes <- topTags(lrt, n = Inf) 
topGenes
DEGs <- topGenes$table
write.table(DEGs, file = "DEGs_edger_2vs1.csv", sep = ",", row.names = FALSE)
