\name{rCMP}
\alias{rCMP}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Random number generator from CMP}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
rCMP(n, lambda, mu, nu, tol = 0.01, x_max = 200)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{n}{
%%     ~~Describe \code{n} here~~
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
  \item{tol}{
%%     ~~Describe \code{tol} here~~
}
  \item{x_max}{
%%     ~~Describe \code{x_max} here~~
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
function (n, lambda, mu, nu, tol = 0.01, x_max = 200) 
{
    loglike_x = rep(NA, x_max + 1)
    for (x in 0:x_max) {
        if (!missing(mu) & !missing(lambda)) 
            stop("'mu' and 'lambda' both specified")
        if (missing(mu) & !missing(lambda)) 
            loglike_x[x + 1] = dCMP(x = x, lambda = lambda, mu = mu, 
                nu = nu, log = TRUE, tol = tol, iter.max = x_max)
        if (!missing(mu) & missing(lambda)) 
            loglike_x[x + 1] = dCMP(x = x, lambda = lambda, mu = mu, 
                nu = nu, log = TRUE, tol = tol, iter.max = x_max)
        if (missing(mu) & missing(lambda)) 
            stop("Neither 'mu' or 'lambda' is specified")
    }
    n = sample(x = 0:x_max, size = n, replace = TRUE, prob = exp(loglike_x))
    return(n)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
