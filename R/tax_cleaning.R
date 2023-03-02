#' Clean taxonomic data from QIIME2
#'
#' This function takes a taxonomic data frame and cleans it for downstream analysis.
#'
#' @param tax_df A taxonomic data frame with at least 7 columns.
#' @return A cleaned taxonomic data frame.
#' @examples
#' @import stringr
#' @export
#'
#' @examples
#' tax_cleaning(data.frame(Kingdom = c("d__Bacteria", "d__Archaea"),
#'                          Phylum = c("p__Firmicutes", ""),
#'                          Class = c("c__Bacilli", ""),
#'                          Order = c("o__Bacillales", ""),
#'                          Family = c("f__Bacillaceae", ""),
#'                          Genus = c("g__Bacillus", ""),
#'                          Species = c("s__subtilis", "")))
tax_cleaning <- function(tax_df) {

  # Keep only first 7 columns
  tax_df <- tax_df[, 1:7]

  # Set informative column names
  colnames(tax_df) <- c("Kingdom", "Phylum", "Class", "Order", "Family", "Genus", "Species")

  # Remove prefixes and replace underscores with spaces
  for (i in 1:ncol(tax_df)) {
    tax_df[, i] <- str_replace_all(tax_df[, i], "^[a-z]__", "")
    tax_df[, i] <- str_replace_all(tax_df[, i], "_", " ")
  }

  # Replace missing taxonomy levels with higher level taxa
  for (i in 1:nrow(tax_df)) {
    if (tax_df[i, "Species"] == "") {
      if (tax_df[i, "Genus"] == "") {
        if (tax_df[i, "Family"] == "") {
          if (tax_df[i, "Order"] == "") {
            if (tax_df[i, "Class"] == "") {
              tax_df[i, "Phylum"] <- paste("Phylum", tax_df[i, "Phylum"], sep = ": ")
            } else {
              tax_df[i, "Class"] <- paste("Class", tax_df[i, "Class"], sep = ": ")
            }
          } else {
            tax_df[i, "Order"] <- paste("Order", tax_df[i, "Order"], sep = ": ")
          }
        } else {
          tax_df[i, "Family"] <- paste("Family", tax_df[i, "Family"], sep = ": ")
        }
      } else {
        tax_df[i, "Genus"] <- paste("Genus", tax_df[i, "Genus"], sep = ": ")
      }
    } else {
      tax_df[i, "Species"] <- paste("Species", tax_df[i, "Species"], sep = ": ")
    }
  }

  return(tax_df)
}
