## ----global_options, include=FALSE--------------------------------------------
knitr::opts_chunk$set(fig.width=5,fig.align = 'center')

## ----setup-blind,include=FALSE------------------------------------------------
library(Matrix)

## ----setup, warning=FALSE,message=FALSE---------------------------------------
library(netrankr)
library(igraph)
library(magrittr)

## ----pos_dom------------------------------------------------------------------
data("dbces11")
g <- dbces11

#neighborhood inclusion 
P <- g %>% neighborhood_inclusion(sparse = FALSE)

#without %>% operator:
# P <- neighborhood_inclusion(g)

cent_scores <- data.frame(
   degree=degree(g),
   betweenness=round(betweenness(g),4),
   closeness=round(closeness(g),4),
   eigenvector=round(eigen_centrality(g)$vector,4),
   subgraph=round(subgraph_centrality(g),4))

plot(rank_intervals(P),cent_scores = cent_scores)

## ----calc_probs---------------------------------------------------------------
res <- exact_rank_prob(P)
res

## ----rk_probs-----------------------------------------------------------------
rp <- round(res$rank.prob,2)
rp

## ----rk_top-------------------------------------------------------------------
rp[,11]

## ----rrp----------------------------------------------------------------------
rrp <- round(res$relative.rank,2)
rrp

## ----rk_exp-------------------------------------------------------------------
ex_rk <- round(res$expected.rank,2)
ex_rk

