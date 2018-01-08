#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
Rcpp::List checkPairs(NumericVector x,NumericVector y) {
  int Con=0;
  int Dis=0;
  int Tie=0;
  int Left=0;
  int Right=0;
  
  int n=x.size();
  for(int i=0; i<n-1; ++i){
    for(int j=i+1; j<n; ++j){
      if(((x[i]>x[j]) & (y[i]>y[j])) | ((x[i]<x[j]) & (y[i]<y[j]))){
        Con+=+1;
      }
      else if(((x[i]>x[j]) & (y[i]<y[j])) | ((x[i]<x[j]) & (y[i]>y[j]))){
        Dis+=+1;
      }
      else if((x[i]==x[j]) & (y[i]==y[j])){
        Tie+=1;
      }
      else if((x[i]==x[j]) & (y[i]!=y[j])){
        Left+=1;
      }
      else{
        Right+=1;
      }
      
    }
  }
  return Rcpp::List::create(Rcpp::Named("concordant") = Con, 
                             Rcpp::Named("discordant") = Dis,
                             Rcpp::Named("ties")=Tie,
                             Rcpp::Named("left")=Left,
                             Rcpp::Named("right")=Right);
}


