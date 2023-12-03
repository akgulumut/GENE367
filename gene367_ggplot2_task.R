#install the required packages

install.packages("readxl")
install.packages("ggplot2")

#activate the packages
library(readxl)
library(ggplot2)

### The First task

##Read the data
trait_data <- read_xlsx("mock_data_gene367.xlsx", sheet = 1)

#Create the smooth plot 
smth_plot <- ggplot(trait_data, 
       aes(x = bill_length_st, y = tarsus_length_st)) + 
  geom_smooth(color = "darkgreen") + geom_point(color = "red", shape = 19) + 
  labs(title = "Relationship between bill length and tarsus length", 
       subtitle = "Made by using ggplot2",
       x = "Bill length (mm)",
       y = "Tarsus length (mm)")  + theme_minimal() +
  theme(panel.grid.major = element_line(color = "gray", linetype = "dashed"),
        panel.background = element_rect(fill = "lightgray"), 
        axis.text = element_text(size = 8),
        plot.title = element_text(size = 14, face = "bold"),
        plot.subtitle = element_text(color = "gray30", face = "italic", size=11))

#save the plot into the workspace

ggsave(plot = smth_plot, filename = "plot1.tiff", device = "tiff", 
       units = "in", width = 7, height = 5, dpi = 300)



########## The Second Task

#install the required packages

install.packages("readxl")
install.packages("ggplot2")

#activate the packages

library(readxl)
library(ggplot2)

#get the data
trait_data <- read_xlsx("mock_data_gene367.xlsx", sheet = 1)

#making plot of body mass histogram
p <- ggplot(trait_data, aes(x = body_mass_wi_du, fill = early_developmental_mode_st)) +
  geom_histogram(colour = "black",
                 lwd = 0.75,
                 linetype = 1,
                 position = "identity", bins = 10, binwidth = 1000) + 
                 labs(fill = "Early developmental stage",
                      title = "Distribution of body mass for different types of early developmental stage", 
                      subtitle = "Made by using ggplot2 ") + xlab("Body mass (g)") +
                 theme(plot.subtitle = element_text(color = "gray30", face = "italic"),
                       plot.title = element_text(size = 14, face = "bold"), 
                       panel.border = element_rect(fill = NA, color = "gray30"))
  
#wrapping histograms according to early_developmental_st
plot_hist <- p + facet_wrap(vars(early_developmental_mode_st))

#save the plot into the workspace
ggsave(plot = plot_hist, filename = "plot2.tiff", device = "tiff", 
       units = "in", width = 8, height = 5, dpi = 300)
