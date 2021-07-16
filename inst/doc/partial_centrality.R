## ----global_options, include=FALSE--------------------------------------------
knitr::opts_chunk$set(fig.width=5,fig.align = 'center')

## ----setup, warning=FALSE,message=FALSE---------------------------------------
library(netrankr)
library(igraph)
library(magrittr)

## ----pos_dom------------------------------------------------------------------
data("dbces11")
g <- dbces11

#neighborhood inclusion 
P <- g %>% neighborhood_inclusion()

#without %>% operator:
# P <- neighborhood_inclusion(g)

rank_intervals(P)

## ----vis_intervals_cent-------------------------------------------------------

cent_scores <- data.frame(
   degree=degree(g),
   betweenness=round(betweenness(g),4),
   closeness=round(closeness(g),4),
   eigenvector=round(eigen_centrality(g)$vector,4))

rk_int <- rank_intervals(P)
plot(rk_int,cent_scores = cent_scores)

## ----tg_ri--------------------------------------------------------------------
set.seed(123)
tg <- threshold_graph(20,0.2)

#neighborhood inclusion 
P <- tg %>% neighborhood_inclusion()

#without %>% operator:
# P <- neighborhood_inclusion(tg)
plot(rank_intervals(P))

## ----tg_ri_cent,out-----------------------------------------------------------
cent_scores <- data.frame(
   degree=degree(tg),
   betweenness=round(betweenness(tg),4),
   closeness=round(closeness(tg),4),
   eigenvector=round(eigen_centrality(tg)$vector,4))


plot(rank_intervals(P),cent_scores = cent_scores)

