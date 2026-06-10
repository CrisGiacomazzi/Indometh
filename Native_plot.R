# Load the dataset
data("Indometh")

# Load library
library(ggplot2)

# Explore dataset
head(Indometh)

View(Indometh)

dim(Indometh)

max(Indometh$time)

# Plot 
ggplot(data = Indometh, aes(x = time, y = conc, group = Subject))+
  geom_line()+
  labs(x="Time (h)", y = "Concentration (mg/L)")
