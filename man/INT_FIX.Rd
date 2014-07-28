\name{INT_FIX}
\alias{INT_FIX}
\title{
Gene-environment interaction test treating genetic main effects as fixed
}
\description{
Perform the interaction term only test for gene-environment interaction, assuming fixed genetic main effects.
}
\usage{
INT_FIX(phenotype, genotypes, covariates, mainweights = wuweights, 
interweights = wuweights, family = "gaussian", binomialimpute = FALSE)
}
\arguments{
  \item{phenotype}{
a numeric vector of phenotype values.
}
  \item{genotypes}{
a matrix or a data frame for all SNPs in the test gene or genomic region. The order of rows must match the order in \code{phenotype}.
}
  \item{covariates}{
a matrix, a data frame or a vector of covariates to adjust for. The interaction between SNPs and the first column of \code{covariates} is tested. The order of rows must match the order in \code{phenotype}.
}
  \item{mainweights}{
the weight function or vector of genetic main effects (default = wuweights).
}
  \item{interweights}{
the weight function or vector of gene-environment interaction effects (default = wuweights).
}
  \item{family}{
"gaussian" for quantitative traits and "binomial" for dichotomous traits (default = "gaussian").
}
  \item{binomialimpute}{
impute missing genotypes randomly using a binomial distribution with 2 trials and success probability equal to the minor allele frequency. If FALSE, then impute missing genotypes to 0 (default = FALSE).
}
}
\value{
p-value.
}
\references{
Chen H, Meigs JB, Dupuis J. (2014) Incorporating gene-environment interaction in testing for association with rare genetic variants. Hum Hered 78, 81-90.

Wu MC, Lee S, Cai T, Li Y, Boehnke M, Lin X. (2011) Rare-variant association testing for sequencing data with the sequence kernel association test. Am J Hum Genet 89, 82-93.
}
\author{
Han Chen
}
\seealso{
\code{\link{INT_RAN}}, \code{\link{rareGE}}
}
\examples{
data(rareGEgeno)
data(rareGEpheno)
# quantitative traits - testing for gene-BMI interactions
INT_FIX(rareGEpheno$y1, rareGEgeno, rareGEpheno[, c("bmi", "age", "sex")])
# dichotomous traits - testing for gene-BMI interactions
INT_FIX(rareGEpheno$y2, rareGEgeno, rareGEpheno[, c("bmi", "age", "sex")], 
	family = "binomial")
}
\keyword{ gene-environment interaction }
\keyword{ rare variant }
