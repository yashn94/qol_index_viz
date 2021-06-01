# Load library
install.packages("collapsibleTree")
install.packages("htmlwidgets")
library(collapsibleTree)
library(htmlwidgets)

#set working directory
setwd("data")

#load dataset with only dimensions and indicators
qol_indicator_dimension <- read_excel("qol_dimensions_indicators.xlsx")

#create tree diagram 
tree <- collapsibleTree( qol_indicator_dimension, hierarchy = c("Dimension","Indicator"),
                         root = "QoL Index",
                         fill = c("black", 
                                  #colours for each dimension
                                  c("#3E5D92", "#832A2F", "#ED8A73", "#CC5A31","#DEC478","#6E9C73","#7ABEBF"),
                                  #colours for services dimension indicators
                                  c("#3E5D92", "#3E5D92", "#3E5D92", "#3E5D92","#3E5D92","#3E5D92",
                                  #colours for social class indicators
                                    "#832A2F","#832A2F","#832A2F","#832A2F","#832A2F",
                                  #colours for government satisfaction indicators
                                    "#ED8A73","#ED8A73","#ED8A73","#ED8A73","#ED8A73",
                                  #colours for life satisfaction indicators,
                                    "#CC5A31","#CC5A31","#CC5A31","#CC5A31","#CC5A31",
                                  #colours for health indicators
                                    "#DEC478","#DEC478","#DEC478",
                                  #colours for safety indicators
                                    "#6E9C73","#6E9C73","#6E9C73","#6E9C73","#6E9C73",
                                  #colours for participation indcators
                                    "#7ABEBF","#7ABEBF","#7ABEBF","#7ABEBF")
                                    ),
                         fontSize = 15,
                         collapsed = TRUE,
                         zoomable = FALSE
                         )
tree


# save widget
saveWidget(tree, file=paste0( getwd(), "qol_tree.html"))



