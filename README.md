# Tax Cleaning
The tax_cleaning function is designed to clean and standardize taxonomy data in a given dataset. It takes a data frame with taxonomy information and returns a cleaned version with standardized names, filled holes, and missing information.

# Installation
You can install the package using the following command:
```
devtools::install_github("shashank-KU/taxcleanr")
```

# Usage
To use the tax_cleaning function, first load the package with the library() function. Then, call the function with your data frame as the argument:
```
library(tax_cleaning)

clean_tax <- tax_cleaning(taxonomy_data)
```
# Input
The function takes a data frame as input, where each row represents a unique taxonomy. The data frame must have at least seven columns, named "Kingdom", "Phylum", "Class", "Order", "Family", "Genus", and "Species".

# Output
The function returns a cleaned version of the input data frame, with standardized names and filled holes. The output data frame has the same structure as the input, with each taxonomy name in its own column.

# Example
```
library(tax_cleaning)

# Create example data frame
taxonomy_data <- data.frame(
  Kingdom = c("d__Bacteria", "d__Bacteria", "d__Archaea", "d__Archaea", "d__Archaea"),
  Phylum = c("p__Actinobacteria", "p__Firmicutes", "p__Crenarchaeota", "p__Euryarchaeota", ""),
  Class = c("c__Actinobacteria", "c__Bacilli", "c__Thermoprotei", "c__Methanomicrobia", ""),
  Order = c("o__Actinomycetales", "o__Bacillales", "o__Desulfurococcales", "", ""),
  Family = c("f__Streptomycetaceae", "f__Staphylococcaceae", "", "", ""),
  Genus = c("g__Streptomyces", "", "", "", ""),
  Species = c("s__coelicolor", "", "", "", "")
)

# Clean taxonomy data
clean_tax <- tax_cleaning(taxonomy_data)
```

The resulting clean_tax data frame will have standardized taxonomy names and filled holes.
