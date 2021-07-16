## ----setup, warning=FALSE,message=FALSE---------------------------------------
library(netrankr)
library(igraph)
library(magrittr)
set.seed(1886) #for reproducibility

## ----pos_dom------------------------------------------------------------------
data("dbces11")
g <- dbces11

#neighborhood inclusion can be expressed with the analytic pipeline
D <- g %>% indirect_relations(type="adjacency") %>% positional_dominance()

## ----homo_and_hetero----------------------------------------------------------
D <- g %>% 
  indirect_relations(type="adjacency") %>% 
  positional_dominance(map=TRUE)

comparable_pairs(D)

## ----dist---------------------------------------------------------------------
D1 <- g %>% 
  indirect_relations(type="dist_sp") %>% 
  positional_dominance(map=FALSE,benefit=FALSE)

## ----homo_and_hetero_dist-----------------------------------------------------
D1 <- g %>% 
  indirect_relations(type="dist_sp") %>% 
  positional_dominance(map=FALSE,benefit=FALSE)

D2 <- g %>% 
  indirect_relations(type="dist_sp") %>% 
  positional_dominance(map=TRUE,benefit=FALSE)

c("heterogeneity"=comparable_pairs(D1),
  "homogeneity"=comparable_pairs(D2))


## ----homo_in_hetero-----------------------------------------------------------
all(D1!=1 | D2==1) 

