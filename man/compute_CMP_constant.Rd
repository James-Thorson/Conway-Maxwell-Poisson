\name{compute_CMP_constant}
\alias{compute_CMP_constant}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Function to calculate the integration constant for CMP distribution}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
compute_CMP_constant(Lambda, Nu, Mu, Tol, Max, Log = TRUE, Type = "Z")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Lambda}{
%%     ~~Describe \code{Lambda} here~~
}
  \item{Nu}{
%%     ~~Describe \code{Nu} here~~
}
  \item{Mu}{
%%     ~~Describe \code{Mu} here~~
}
  \item{Tol}{
%%     ~~Describe \code{Tol} here~~
}
  \item{Max}{
%%     ~~Describe \code{Max} here~~
}
  \item{Log}{
%%     ~~Describe \code{Log} here~~
}
  \item{Type}{
%%     ~~Describe \code{Type} here~~
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
function (Lambda, Nu, Mu, Tol, Max, Log = TRUE, Type = "Z") 
{
    if ((!is.na(Lambda) & Lambda > 10^Nu) | (!is.na(Mu) & Mu^Nu > 
        10^Nu)) {
        if (Type == "Z") {
            ln_Const = Nu * Lambda^(1/Nu) - ((Nu - 1)/(2 * Nu)) * 
                log(Lambda) - ((Nu - 1)/2) * log(2 * pi) - (1/2) * 
                log(Nu)
        }
        if (Type == "S") {
            ln_Const = Nu * Mu - ((Nu - 1)/(2)) * log(Mu) - ((Nu - 
                1)/2) * log(2 * pi) - (1/2) * log(Nu)
        }
    }
    else {
        Const = rep(0, Max + 1)
        Index = 1
        Const[Index] = 1
        while (Const[Index]/Const[1] > Tol) {
            if (Type == "Z") 
                Const[Index + 1] = Const[Index] * (Lambda/Index^Nu)
            if (Type == "S") 
                Const[Index + 1] = Const[Index] * (Mu/Index)^Nu
            Index = Index + 1
        }
        ln_Const = log(sum(Const))
    }
    if (Log == TRUE) 
        Return = ln_Const
    if (Log == FALSE) 
        Return = exp(ln_Const)
    return(Return)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
