\name{JOINT}
\alias{JOINT}
\title{
Joint test of genetic main effects and gene-environment interactions
}
\description{
Perform a joint test of genetic main effects and gene-environment interactions, using a Monte Carlo approach to calculate the p-value.
}
\usage{
JOINT(phenotype, genotypes, covariates, mainweights = wuweights, 
interweights = wuweights, family = "gaussian", binomialimpute = FALSE, 
rho = seq(0, 1, by = 0.1), B = 10000)
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
  \item{rho}{
a numeric vector with values between 0 and 1 defining the searching grid for the nuisance parameter \eqn{\rho} in the joint test.
}
  \item{B}{
number of Monte Carlo simulations to approximate the multi-dimensional integral in calculating the p-value of the joint test (default = 10000).
}
}
\value{
\item{pJOINT}{p-value of the joint test.}
\item{pJOINTmin}{minimum raw p-value from the searching grid of the joint test.}
\item{pJOINTrho}{\eqn{\rho} value where the minimum raw p-value is attained in the joint test.}
\item{pJOINTps}{a vector of raw p-values in the joint test.}
\item{pJOINTinfo}{a summary of the distribution of the integrand in each Monte Carlo simulation in the joint test. \code{pJOINT} is the mean excluding missing values.}
}
\references{
Chen H, Meigs JB, Dupuis J. (2014) Incorporating gene-environment interaction in testing for association with rare genetic variants. Hum Hered 78, 81-90.

Lee S, Wu MC, Lin X. (2012) Optimal tests for rare variant effects in sequencing association studies. Biostatistics 13, 762-775.

Wu MC, Lee S, Cai T, Li Y, Boehnke M, Lin X. (2011) Rare-variant association testing for sequencing data with the sequence kernel association test. Am J Hum Genet 89, 82-93.
}
\author{
Han Chen
}
\seealso{
\code{\link{rareGE}}
}
\examples{
set.seed(12345)
data(rareGEgeno)
data(rareGEpheno)
# quantitative traits - testing for gene-BMI interactions
JOINT(rareGEpheno$y1, rareGEgeno, rareGEpheno[, c("bmi", "age", "sex")],
	B = 1000)
# dichotomous traits - testing for gene-BMI interactions
JOINT(rareGEpheno$y2, rareGEgeno, rareGEpheno[, c("bmi", "age", "sex")], 
	family = "binomial", B = 1000)
}
\keyword{ gene-environment interaction }
\keyword{ rare variant }
\keyword{ joint test }
