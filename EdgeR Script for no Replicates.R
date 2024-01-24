# EdgeR Script for no Replicates.
library(edgeR)
data <- read.csv("GSE86394.csv")
group <- factor(c(1:2))
dgs <- DGEList(counts = data, group=group)
dgs <- calcNormFactors(dgs, method="TMM")
design <- model.matrix(~group)
design
bcv <- 0.4
et <- exactTest(dgs, dispersion = bcv^2)
et
top_dgs = topTags(object = et, n = "Inf")
top_dgs
summary(decideTests(object = et, lfc = 1))
write.csv(top_dgs,"fit0.4_edger2vs1.csv")
