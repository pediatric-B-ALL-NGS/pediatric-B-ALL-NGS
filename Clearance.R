library(ggplot2)
library(ggsci)
library(extrafont)

# IGH
data2 <- read.csv("IGH.csv",header = TRUE)
pdf("IGH.pdf",width =5.42,height =4.17,onefile = FALSE)
ggplot(data2,aes(x=factor(group1,levels = c("Initial", "before CAM","3month")), y=MRD)) + 
  scale_y_log10() +
  geom_boxplot(aes(colour = group1), show.legend = FALSE, width = 0.2,outlier.colour = NA,lwd = 0.5) +
  labs(x="Time", y="Clone frequency", title="IGH") +
  scale_x_discrete(labels=c("Diagnosis", "EOI","EOC")) +
  theme_classic()+
  theme(text =element_text(family = "Helvetica"), plot.title = element_text(face="bold",hjust=0.5,size=16),
        axis.title.y = element_text(face="bold",margin=margin(r=5), size=16), axis.title.x = element_text(face="bold",margin=margin(t=5),size=16), axis.text = element_text(size=16, color="black")) +
  geom_point(aes(colour = group1), show.legend = FALSE, size=1, position = position_dodge(0.2), alpha=0.4) + 
  scale_colour_manual(values=c("#7E6148B2","#E86463","#3C5488B2")) +
  geom_line(aes(group = group2), colour = "#666666", linetype= 3) +
  stat_summary(fun.y=median, geom="point", shape="*",size=10, color="#F09205")
dev.off();


