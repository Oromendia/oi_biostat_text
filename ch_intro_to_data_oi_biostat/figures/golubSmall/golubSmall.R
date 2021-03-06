library(openintro)
#data(golub)
data(COL)

#create golub.small
cols = c(6, 50:59)
golub.small = golub[16:25, cols]
colnames(golub.small) <- c("cancer", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J")

#calculate differences in means
gene.matrix = as.matrix(golub.small[,-1])
leuk.type = (golub.small$cancer == "aml")
table(leuk.type)

aml.mean.expression = apply(gene.matrix[leuk.type == TRUE,], 2, mean)
all.mean.expression = apply(gene.matrix[leuk.type == FALSE,], 2, mean)

diff.mean.expression = (aml.mean.expression - all.mean.expression)

myPDF("golubSmallHist.pdf",
      6.05, 3.1,
      mar = c(3.5, 3.5, 0.5, 1),
      mgp = c(2.4, 0.7, 0))
histPlot(diff.mean.expression,
         breaks = 5,
         xlab = 'Difference in Mean Expression (AML-ALL)',
         ylab = "Frequency",
         ylim = c(0, 6),
         col = COL[1],
         border = COL[5])
dev.off()


myPDF("golubSmallBoxPlot.pdf", 3, 3.7,
      mar = c(1, 4.1, 1, 0.5),
      mgp = c(3, 0.5, 0))

boxPlot(diff.mean.expression,
        ylab = 'Difference in Mean Expression (AML-ALL)',
        ylim = c(-4000, 10000),
        pch = 19,
        pchCex = 1.2,
        lcol = COL[1],
        col = COL[1,3])

dev.off()