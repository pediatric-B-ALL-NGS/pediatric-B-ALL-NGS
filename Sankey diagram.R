library(tidyverse)
library(viridis)
library(patchwork)
library(networkD3)
library(webshot)

data_long <- read.csv("data_long.csv",header = TRUE)

colnames(data_long) <- c("source", "target", "value")
data_long$target <- paste(data_long$target, " ", sep="")
nodes <- data.frame(name=c(as.character(data_long$source), as.character(data_long$target)) %>% unique())#??????nodes
data_long$IDsource=match(data_long$source, nodes$name)-1 
data_long$IDtarget=match(data_long$target, nodes$name)-1
data_long$group 
data_long$group <- as.factor(c("type_a","type_a","type_a","type_b","type_b","type_c"))

ColourScal='d3.scaleOrdinal() .domain(["type_a","type_b","type_c","Undetectable", "MRD<10e-4", "MRD>=10e-4"]) .range(["#3C5488B2","#E86463","#7E6148B2","#3C5488B2","#E86463","#7E6148B2"])'

p = sankeyNetwork(Links = data_long, Nodes = nodes,
              Source = "IDsource", Target = "IDtarget",
              Value = "value", NodeID = "name", 
              sinksRight=FALSE, colourScale=ColourScal,LinkGroup = "group",nodeWidth=65,height=700, width=900, fontSize=0, nodePadding=10)
saveNetwork(p, "sankey.html")

