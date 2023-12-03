# Install required packages
install.packages(c("FD", "ape", "readxl", "tidyverse"))

# Load required packages
library(FD)
library(ape)
library(readxl)
library(tidyverse)

# Read the Excel file
data <- read_xlsx("gene_367_evolution.xlsx")

# Extract the sequence data
sequences <- as.matrix(data[, 3:14])
rownames(sequences) <- data$individual_ID

# Convert the sequences to DNAbin format
sequences_dnabin <- as.DNAbin(sequences)


# Calculate the genetic distances
distances <- dist.dna(sequences_dnabin, model = "raw")

# Convert the distances to a numeric matrix
dist_matrix <- as.matrix(distances)

# Calculate Gower distances
gower_distances <- gowdis(dist_matrix)

# Perform hierarchical clustering
clustering <- hclust(gower_distances, method = "average")

# Convert the clustering result to phylo format
phylo_tree <- as.phylo(clustering)

# Plot the phylogenetic tree


plot(phylo_tree, show.tip.label = TRUE, edge.color = rainbow(length(phylo_tree$edge.length)),
     label.offset = 0.004, 
     bg = "lightblue", tip.color = "black", edge.width = 2, cex = 0.85) 
title("Phylogenetic tree of the Eurasian Golden Tomby individuals", sub = "Divergence", )
axisPhylo(side = 1, col = "darkgray", tick = TRUE, cex = 0.8, lwd = 1, las = 2)



# Example combining different effects
#plot(phylo_tree, show.tip.label = TRUE, 
#     edge.color = rainbow(length(phylo_tree$edge.length)),
#     label.offset = 0.04, bg = heat.colors(length(phylo_tree$tip.label)),
#     edge.width = 2, type = "fan", cex = 0.45)
#title("Phylogenetic tree of the Eurasian Golden Tomby individuals")
