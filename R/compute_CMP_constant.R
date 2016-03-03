compute_CMP_constant <-
function(Lambda, Nu, Mu, Tol, Max, Log=TRUE, Type="Z"){       # Mu = Lambda^(1/Nu)
  if( (!is.na(Lambda) & Lambda > 10^Nu) | (!is.na(Mu) & Mu^Nu > 10^Nu) ){
    if(Type=="Z"){
      #Const = exp(Nu*Lambda^(1/Nu)) / ( Lambda^((Nu-1)/(2*Nu)) * (2*pi)^((Nu-1)/2) * sqrt(Nu) )
      ln_Const = Nu*Lambda^(1/Nu) - ((Nu-1)/(2*Nu))*log(Lambda) - ((Nu-1)/2)*log(2*pi) - (1/2)*log(Nu)
    }
    if(Type=="S"){
      #Const = exp(Nu*Mu) / ( Mu^((Nu-1)/(2)) * (2*pi)^((Nu-1)/2) * sqrt(Nu) )
      ln_Const = Nu*Mu - ((Nu-1)/(2))*log(Mu) - ((Nu-1)/2)*log(2*pi) - (1/2)*log(Nu)
    }
  }else{
    Const = rep(0,Max+1)
    Index = 1
    Const[Index] = 1    # Z(0)
    while( Const[Index]/Const[1] > Tol ){
      if(Type=="Z") Const[Index+1] = Const[Index] * ( Lambda / Index^Nu )  # Z(Index)
      if(Type=="S") Const[Index+1] = Const[Index] * ( Mu / Index )^Nu  # Z(Index)
      Index = Index + 1
    }
    ln_Const = log(sum(Const))
  }
  if(Log==TRUE) Return = ln_Const
  if(Log==FALSE) Return = exp(ln_Const)
  return(Return)
}
