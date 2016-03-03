dCMP <-
function( x, lambda, mu, nu, log=TRUE, tol=0.01, iter.max=200 ){
  if(!missing(mu) & !missing(lambda)) stop("'mu' and 'lambda' both specified")
  if(missing(mu) & !missing(lambda)) loglike = x*log(lambda) - nu*lfactorial(x) - compute_CMP_constant(Lambda=lambda, Nu=nu, Mu=NA, Tol=tol, Max=iter.max, Log=TRUE, Type="Z")
  if(!missing(mu) & missing(lambda)) loglike = nu*x*log(mu) - nu*lfactorial(x) - compute_CMP_constant(Lambda=NA, Nu=nu, Mu=mu, Tol=tol, Max=iter.max, Log=TRUE, Type="S")
  if(missing(mu) & missing(lambda)) stop("Neither 'mu' or 'lambda' is specified")
  if(log==TRUE) return( loglike )
  if(log==FALSE) return( exp(loglike) )
}
