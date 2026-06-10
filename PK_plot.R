# Load libraries
library(ggplot2)
library(dplyr)

# Load the dataset
data("Indometh")

# Exploratory
head(Indometh)
dim(Indometh)
max(Indometh$time)


# Calculate population central tendency and 95% Confidence Intervals
ci_data <- Indometh %>%
  group_by(time) %>%
  summarise(
    mean = mean(conc),
    lower = mean(conc) - 1.96 * sd(conc)/sqrt(n()),
    upper = mean(conc) + 1.96 * sd(conc)/sqrt(n())
  )

# PK plot
p <- ggplot(data = Indometh, aes(x = time, y = conc, group = Subject)) +
  
  # Reference lines (Strategic Milestones)
  geom_hline(yintercept = 0, linetype = "dashed", color = "grey50", linewidth = 0.7) +
  geom_vline(xintercept = 8, linetype = "solid", color = "grey50", linewidth = 0.7) +
  
  # Milestone Annotation
  annotate("text",
           x = 8,
           y = 2.5,
           label = "End of Study",
           color = "black",
           fontface = "bold",
           hjust = 1.1) +
  
  # Individual patient journey 
  geom_line(aes(color = "Individual Profile"), alpha = 0.6) +
  
  # Raw observed plasma concentrations
  geom_point(color = "black", size = 1.5) +
  
  # 95% CI lines
  geom_line(
    data = ci_data,
    aes(x = time, y = lower, color = "95% CI"),
    inherit.aes = FALSE,
    linetype = "dotted",
    linewidth = 0.8
  ) +
  geom_line(
    data = ci_data,
    aes(x = time, y = upper, color = "95% CI"),
    inherit.aes = FALSE,
    linetype = "dotted",
    linewidth = 0.8
  ) +
  # Population mean trend line
  stat_summary(fun = median, geom = "line", aes(group = 1, color = "Population Median"),
               linewidth = 1.2) +
  # Manual Color and Legend Customization
  scale_color_manual(
    name = "Study Metrics",
    values = c(
      "Individual Profile" = "grey70",
      "Population Median" = "red",
      "95% CI" = "red"
    ),
    breaks = c("Population Median", "95% CI", "Individual Profile") # Forces professional order
  ) +
  
  # Customizes the legend 
  guides(
    color = guide_legend(
      override.aes = list(
        linetype = c("solid", "dotted", "solid"),
        linewidth = c(1.2, 0.8, 1)
      )
    )
  ) +
  # Theme Personalization
  theme_classic() +
  labs(
    title = "Indometh - Population Pharmacokinetics",
    x = "Time (h)",
    y = "Drug concentration in Plasma (mg/L)"
  ) +
  theme(
    plot.title = element_text(face = "bold", size = 14, margin = margin(b = 10)),
    axis.title = element_text(face = "bold", size = 11),
    axis.text = element_text(color = "black", size = 10),
    legend.position = "bottom",
    legend.title = element_text(face = "bold", size = 10),
    legend.text = element_text(size = 9)
  )
# 
print(p)