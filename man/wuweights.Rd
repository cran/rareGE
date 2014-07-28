\name{wuweights}
\alias{wuweights}
\title{
Wu weight function
}
\description{
Calculate beta density weights with parameters 1 and 25 as proposed by Wu et al. (2011)
}
\usage{
wuweights(maf)
}
\arguments{
  \item{maf}{
a numeric vector of minor allele frequencies. Values must be between 0 and 1.
}
}
\value{
A numeric vector of weights, with the same length as \code{maf}.
}
\references{
Wu MC, Lee S, Cai T, Li Y, Boehnke M, Lin X. (2011) Rare-variant association testing for sequencing data with the sequence kernel association test. Am J Hum Genet 89, 82-93.
}
\author{
Han Chen
}
\examples{
maf <- seq(0, 1, by=0.1)
wuweights(maf)
}
