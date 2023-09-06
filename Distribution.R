library(ggplot2)
library(reshape2)
data = data.frame(read.csv("1_HTS-20220525.csv",header = TRUE))

a <- factor(c,levels = c("0","1","2","3","4","5",">=6"))
b <- c(31,96,116,86,58,21,22)
data1 <- data.frame(a,b)
pdf("B-lineage.pdf",width =7.3,height =5.62,onefile = FALSE)
ggplot(data1, aes(x = a, y = b)) +
  geom_bar(fill = "#3C5488B2", stat = "identity",show.legend = FALSE,width =0.7) +
  geom_text(aes(label = b), vjust = -0.3,size = 5) + 
  theme_classic() +
  ylim(0, 145) +
  theme(legend.position =c(.88, .88),text =element_text(family = "Helvetica"), plot.title = element_text(face="bold"),
        axis.title.y = element_text(face="bold",margin=margin(r=3), size=16), axis.title.x = element_text(face="bold",margin=margin(t=3),size=16), axis.text = element_text(size=15, color="black"),
        legend.title = element_text(size = 6),legend.text = element_text(size = 6 ),
        legend.key.height= unit(0.25, 'cm'),
        legend.key.width= unit(0.5, 'cm'))+
  labs(x="Number of clonotypes", y="Number of patients") 
dev.off();


