# Libraries
library(tidyverse)

#set working directory
setwd("data")
getwd()

#load dataset
qol_dimension_values <- read_excel("qol_dimension_values_all_iterations_v2.xlsx")

#use qol 6 dimensions
qol_6_dims <- qol_dimension_values[1,]
qol_6_dims

#labels

label_data <- qol_dimension_values

# calculate the ANGLE of the labels
number_of_bar <- nrow(label_data)
angle <-  90 - 360 *(label_data$ID-0.5)/number_of_bar

# calculate the alignment of labels: right or left
# If I am on the left part of the plot, my labels have currently an angle < -90
label_data$hjust<-ifelse( angle < -90, 1, 0)

# flip angle BY to make them readable
label_data$angle<-ifelse(angle < -90, angle+180, angle)

#circular bar plot

circ <- qol_dimension_values %>% ggplot(aes(x = Dimensions,
                                            y= `qol 6`))+
  geom_bar(stat = "identity", fill = c("#3E5D92", "#832A2F", "#ED8A73", "#CC5A31","#DEC478","#6E9C73","#7ABEBF"))+
  #scale_fill_manual(values=c("#3E5D92", "#832A2F", "#ED8A73", "#CC5A31","#DEC478","#6E9C73","#7ABEBF"))+
 # scale_colour_manual(values=c("#3E5D92", "#832A2F", "#ED8A73", "#CC5A31","#DEC478","#6E9C73","#7ABEBF"))+
  ylim(-100,120) +
  theme_minimal() +
  theme(
    axis.text = element_blank(),
    axis.title = element_blank(),
    panel.grid = element_blank(),
    plot.margin = unit(rep(-1,4), "cm")      # Adjust the margin to make in sort labels are not truncated!
  ) +
  coord_polar(start = 0)+
  geom_text(data=label_data, aes(x = ID, y=`qol 6`, label=Dimensions, hjust=hjust), 
            color="black", fontface="bold",alpha=0.6, size=2.5, angle= label_data$angle, inherit.aes = FALSE )
            

circ




