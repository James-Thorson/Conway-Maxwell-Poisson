\name{dCMP}
\alias{dCMP}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Probabiilty mass function for CMP}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
dCMP(x, lambda, mu, nu, log = TRUE, tol = 0.01, iter.max = 200)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
  \item{lambda}{
%%     ~~Describe \code{lambda} here~~
}
  \item{mu}{
%%     ~~Describe \code{mu} here~~
}
  \item{nu}{
%%     ~~Describe \code{nu} here~~
}
  \item{log}{
%%     ~~Describe \code{log} here~~
}
  \item{tol}{
%%     ~~Describe \code{tol} here~~
}
  \item{iter.max}{
%%     ~~Describe \code{iter.max} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x, lambda, mu, nu, log = TRUE, tol = 0.01, iter.max = 200) 
{
    if (!missing(mu) & !missing(lambda)) 
        stop("'mu' and 'lambda' both specified")
    if (missing(mu) & !missing(lambda)) 
        loglike = x * log(lambda) - nu * lfactorial(x) - compute_CMP_constant(Lambda = lambda, 
            Nu = nu, Mu = NA, Tol = tol, Max = iter.max, Log = TRUE, 
            Type = "Z")
    if (!missing(mu) & missing(lambda)) 
        loglike = nu * x * log(mu) - nu * lfactorial(x) - compute_CMP_constant(Lambda = NA, 
            Nu = nu, Mu = mu, Tol = tol, Max = iter.max, Log = TRUE, 
            Type = "S")
    if (missing(mu) & missing(lambda)) 
        stop("Neither 'mu' or 'lambda' is specified")
    if (log == TRUE) 
        return(loglike)
    if (log == FALSE) 
        return(exp(loglike))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
