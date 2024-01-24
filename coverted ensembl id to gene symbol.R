library(org.Hs.eg.db)
keytypes(org.Hs.eg.db)
columns(org.Hs.eg.db)
x <- read.csv("DEGs_edger_2vs1.csv")
x.df <- as.data.frame(x)
x.df
x.df$symbol <- mapIds(org.Hs.eg.db, keys = x.df$Geneid, keytype = "ENSEMBL", column = "SYMBOL")
x.df
write.table(x.df, file = "s_bbbb.csv", sep = ",", row.names = FALSE)