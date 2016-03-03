rCMP <-
function( n, lambda, mu, nu, tol=0.01, x_max=200 ){
  loglike_x = rep(NA, x_max+1)
  for( x in 0:x_max ){
    if(!missing(mu) & !missing(lambda)) stop("'mu' and 'lambda' both specified")
    if(missing(mu) & !missing(lambda)) loglike_x[x+1] = dCMP( x=x, lambda=lambda, mu=mu, nu=nu, log=TRUE, tol=tol, iter.max=x_max)
    if(!missing(mu) & missing(lambda)) loglike_x[x+1] = dCMP( x=x, lambda=lambda, mu=mu, nu=nu, log=TRUE, tol=tol, iter.max=x_max)
    if(missing(mu) & missing(lambda)) stop("Neither 'mu' or 'lambda' is specified")
  }
  n = sample( x=0:x_max, size=n, replace=TRUE, prob=exp(loglike_x))
  return(n)
}
