#Interactive bar plot

#grouped by dimension
bar <- qol_dimension_values_grouped %>% ggplot(aes(fill = Iteration, x = Dimension, y =Value))+
  geom_bar(position="dodge",stat = "identity")

ggplotly(bar)


