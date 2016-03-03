# Conway-Maxwell-Poisson
R package for calculating probability mass function or simulating draws from a Conway-Maxwell-Poisson distributimon

### Please see the following for more information
Lynch, H.J., Thorson, J.T. & Shelton, A.O. (2014) Dealing with under- and over-dispersed count data in life history, spatial, and community ecology. Ecology, 95, 3173–3180.

# Example usage

```R
devtools::install_github( "James-Thorson/Utilities" )
devtools::install_github( "James-Thorson/Conway-Maxwell-Poisson" )

library( CMP )

# Explore density function
mu = 3
nu = 2

# Simulate
x = rCMP(n=1000, mu=mu, nu=nu)

# Plot distribution
x_i = 0:(mu*4)
ll_i = sapply( x_i, FUN=dCMP, mu=mu, nu=nu )
hist( x, freq=FALSE, breaks=seq(min(x)-0.5,max(x)+0.5,by=1) )
lines( x=x_i, y=exp(ll_i), type="l", col="red")

# Caclulate mean and variance
weighted.mean( x_i, w=exp(ll_i))
ThorsonUtilities::weighted.var( x_i, w=exp(ll_i))
```
