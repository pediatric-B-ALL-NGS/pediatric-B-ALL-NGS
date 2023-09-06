library("survival")
library("survminer")
library("ggfortify") 
library("broom")
library(forestplot)
data2 <- read.csv("20221217.csv",header = TRUE,fileEncoding = "GB2312")

fit <- survfit(Surv(RFSinterval, EFS) ~ IGHEOIpositive10
, data = data2)

pdf("IGH-EOI-positive.pdf",width =7.3,height =5.62,onefile = FALSE)
ggsurvplot(fit,size = 0.8,
           risk.table = TRUE , break.time.by = 12,legend.title = "IGH MRD level at EOI",
           legend.labs = c("MRD<0.0001%", "MRD >=0.0001% & <0.01% ", "MRD>=0.01%"),
           legend = c(0.6, 0.4),
           ylab = "Probability of event free survival",
           xlab = "Time (months)",
           font.y = 16,
           font.x =16,
           font.legend =16,
           pval = "P =0.034",
           pval.coord =c(3,0.4),
           rsk.table.height = 0.25,
           risk.table.pos= 'out',
           table.fontsize =16,
           tables.theme = theme_cleantable(),
           tables.col= "strata",
           risk.table.title = " Number at risk",
           tables.y.text = FALSE,
           linetype = "strata",
           risk.table.fontsize =5.7,
           
           palette =c("#7F8DAF","#E86463","#A89687"))  
dev.off()

surv_pvalue(fit)  

