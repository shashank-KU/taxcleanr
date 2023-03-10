% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tax_cleaning.R
\name{tax_cleaning}
\alias{tax_cleaning}
\title{Clean taxonomic data from QIIME2}
\usage{
tax_cleaning(tax_df)
}
\arguments{
\item{tax_df}{A taxonomic data frame with at least 7 columns.}
}
\value{
A cleaned taxonomic data frame.
}
\description{
This function takes a taxonomic data frame and cleans it for downstream analysis.
}
\examples{
tax_cleaning(data.frame(Kingdom = c("d__Bacteria", "d__Archaea"),
                         Phylum = c("p__Firmicutes", ""),
                         Class = c("c__Bacilli", ""),
                         Order = c("o__Bacillales", ""),
                         Family = c("f__Bacillaceae", ""),
                         Genus = c("g__Bacillus", ""),
                         Species = c("s__subtilis", "")))
}
