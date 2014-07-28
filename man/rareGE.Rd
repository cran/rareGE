\name{rareGE}
\alias{rareGE}
\title{
Tests for gene-environment interaction and joint test of genetic main effects and gene-environment interaction
}
\description{
Perform either gene-environment interaction tests or joint test of genetic main effects and gene-environment interaction, or all 3 tests in one function.
}
\usage{
rareGE(phenotype, genotypes, covariates, mainweights = wuweights, 
interweights = wuweights, family = "gaussian", binomialimpute = FALSE, 
rho = seq(0, 1, by = 0.1), B = 10000, INT_FIX = TRUE, INT_RAN = TRUE, 
JOINT = TRUE)
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
  \item{INT_FIX}{
a logical indicator of whether the interaction test treating genetic main effects as fixed should be performed (default = TRUE).
}
  \item{INT_RAN}{
a logical indicator of whether the interaction test treating genetic main effects as random should be performed (default = TRUE).
}
  \item{JOINT}{
a logical indicator of whether the joint test of genetic main effects and gene-environment interaction effects should be performed (default = TRUE).
}
}
\details{
We use interaction tests and the joint test for different hypotheses. For interaction tests, genetic main effects are included in the null model, either as fixed effects (\code{INT_FIX}) or random effects (\code{INT_RAN}). We do not recommend treating genetic main effects as fixed when the number of SNPs in the gene is not small. For the joint test (\code{JOINT}), genetic main effects are not included in the null model and we are testing genetic effects, allowing for effect modification by the environmental variable. In the joint test, raw p-values are calculated for each value of the nuisance parameter \eqn{\rho}, then the minimum p-value is taken (similar to the optimal test proposed by Lee et al., 2012) and the actual p-value is calculated by multi-dimensional integration, approximated by a Monte Carlo method. This function is designed to perform two or more tests. If performing only one test, please use \code{\link{INT_FIX}}, \code{\link{INT_RAN}} or \code{\link{JOINT}} functions instead to get faster speed (only relevant models are fitted and relevant statistics are computed).
}
\value{
\item{pINT_FIX}{p-value from the interaction test treating genetic main effects as fixed. NULL if \code{INT_FIX} is FALSE.}
\item{pINT_RAN}{p-value from the interaction test treating genetic main effects as random. NULL if \code{INT_RAN} is FALSE.}
\item{pJOINT}{p-value from the joint test of genetic main effects and gene-environment interaction effects. NULL if \code{JOINT} is FALSE.}
\item{pJOINTmin}{minimum raw p-value from the searching grid of the joint test. NULL if \code{JOINT} is FALSE.}
\item{pJOINTrho}{\eqn{\rho} value where the minimum raw p-value is attained in the joint test. NULL if \code{JOINT} is FALSE.}
\item{pJOINTps}{a vector of raw p-values in the joint test. NULL if \code{JOINT} is FALSE.}
\item{pJOINTinfo}{a summary of the distribution of the integrand in each Monte Carlo simulation in the joint test. \code{pJOINT} is the mean excluding missing values. NULL if \code{JOINT} is FALSE.}
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
\code{\link{INT_FIX}}, \code{\link{INT_RAN}}, \code{\link{JOINT}}
}
\examples{
set.seed(12345)
data(rareGEgeno)
data(rareGEpheno)
# quantitative traits - testing for gene-BMI interactions
rareGE(rareGEpheno$y1, rareGEgeno, rareGEpheno[, c("bmi", "age", "sex")],
	B = 1000)
# dichotomous traits - testing for gene-BMI interactions
rareGE(rareGEpheno$y2, rareGEgeno, rareGEpheno[, c("bmi", "age", "sex")],
	family = "binomial", B = 1000)
}
\keyword{ gene-environment interaction }
\keyword{ rare variant }
\keyword{ joint test }
