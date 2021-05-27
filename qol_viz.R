#install packages
#install and load libraries
install.packages("jsonlite", type = "source")
install.packages("rio")
install.packages("haven")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("plotly")
install.packages("corrplot")
install.packages("tidyverse")
install.packages("av")
install.packages("animation")
install.packages("scales")
install.packages ("readxl")

#install libraries
library(haven)
library(corrplot)
library(ggplot2)
library(plotly)
library(readxl)
library(tidyverse)
library(dplyr)
library(av)
library(rio)

#set working directory
setwd("data")
getwd()

#read QoL data
#convert spss file into csv
spss_qol <- read_sav()
convert("130521_qol_data_with_index_final.sav","qol_data_with_index.csv")
qol6_beta <- read.csv("qol_data_with_index.csv")

#subset indicators
ls(qol6_beta)
colnames(qol6_beta)

services_indicator <- qol6_beta[,343:348]
gov_satis_indicator <- qol6_beta[,349:353]
partic_indicator <- qol6_beta[,354:357]
life_satis_indicator <- qol6_beta[,358:362]
health_indicator <- qol6_beta[,363:365]
soc_class_indicator <- qol6_beta[,366:370]
safety_indicator <- qol6_beta[,371:375]


row_names <- colnames(qol6_beta[,343:348])


qol6 <- as.data.frame(qol6_beta)
class(qol6_beta)

plot()


  
#basic bar chart
# QoL index per municipality
#Calculate the average per municipality

bar <- ggplot(data = qol6, mapping = aes(x =municipality,y=QoLIndex_Data_Driven_2))+
  stat_summary(fun.y = "mean", geom = col())

#add plotly interactivity

ggplotly(bar)






