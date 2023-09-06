library(grid)
library(ggplot2)
library(ggtrendline)
dt1 = data.frame(read.csv("dataCAM-original-20230419.csv",header = TRUE))
#CAM heavy vs light chain
y <- dt1$IGLEOI
x <- dt1$IGHEOI
df <- data.frame(x = x, y = y)

pdf("CAM heavy vs light chain.pdf",width =5.43,height =4.18,onefile = FALSE)
ggplot(data = df, mapping = aes(x = x, y = y)) + geom_point(fill= "#E86463", colour= "#E86463") + geom_count(fill= "#E86463", colour= "#E86463")+
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5,size = 16),
        axis.title.x = element_text(size = 16),
        axis.title.y = element_text(size = 16),
        legend.title = element_text(size=16),
        legend.text = element_text(size=16)) +
  scale_y_log10() +
  scale_x_log10() +
  labs(x="Heavy chain", y="Light chain", title="EOI-Heavy vs Light chain")
dev.off();

ggtrendline(x, y, model = "line2P")  

R_pearson <- cor.test(x,y,method = 'pearson')
A <- as.character(R_pearson[["estimate"]] )
B <- as.character(R_pearson[["p.value"]])
C <- paste("heavy vs light chain:", "association =", A, "p.value =", B)
