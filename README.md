
netrankr
========

[![CRAN Status Badge](http://www.r-pkg.org/badges/version/netrankr)](https://cran.r-project.org/package=netrankr) [![CRAN Downloads](http://cranlogs.r-pkg.org/badges/grand-total/netrankr)](https://CRAN.R-project.org/package=netrankr) [![Travis-CI Build Status](https://travis-ci.org/schochastics/netrankr.svg?branch=master)](https://travis-ci.org/schochastics/netrankr) [![codecov](https://codecov.io/gh/schochastics/netrankr/branch/master/graph/badge.svg)](https://codecov.io/gh/schochastics/netrankr)

Overview
--------

netrankr is an R package to analyze partial rankings in the context of networks centrality. While the package includes the possibility to build a variety of indices, its main focus lies on index-free assessment of centrality. Computed partial rankings can be analyzed with a variety of methods. These include probabilistic methods like computing expected node ranks and relative rank probabilities (how likely is it that a node is more central than another?).

Most implemented methods are very general and can be used whenever partial rankings have to be analysed.

Visit the [online manual](https://schochastics.github.io/netrankr) for more Details.

Install
-------

To install from CRAN:

``` r
 install.packages("netrankr")
```

To install the developer version from github:

``` r
#install.packages(devtools)
devtools::install_github("schochastics/netrankr")
```

Details
-------

Check out the [online](http://schochastics.github.io/netrankr) manual for more help.

The core functions of the package are:

-   Computing the neighborhood inclusion preorder with `neighborhood_inclusion()`. The resulting partial ranking is the foundation for any centrality related analysis on undirected and unweighted graphs. More details can be found in the dedicated vignette: `vignette("neighborhood_inclusion",package="netrankr")`.
    A generalizded version of neighborhood inclusion is implemented in `positional_dominance()`. See `vignette("positional_dominance",package="netrankr")` for help.

-   Constructing graphs with a unique centrality ranking with `threshold_graph()`. This class of graphs, known as threshold graphs, can be used to benchmark centrality indices, since they only allow for one ranking of the nodes. For more details consult the vignette: `vignette("threshold_graph",package="netrankr")`.

-   Computing probabilistic centrality rankings. The package includes several function to calculate rank probabilities of nodes in a network, including expected ranks (how central do we expect a node to be?) and relative rank probabilities (how likely is it that a node is more central than another?). These probabilities can either be computed exactly for small networks (`exact_rank_prob()`), based on an almost uniform sample (`mcmc_rank_prob()`) or approximated via several heuristics (`approx_rank_expected()`,`approx_rank_relative()`). Consult `vignette('probabilistic_cent',package='netrankr')` for more information and `vignette('benchmarks',package='netrankr')` for applicability.

-   Although the focus of the package lies on an index-free assessement of centrality, the package provides the possibility to build a variety of indices. Consult `vignette('centrality_indices',package='netrankr')` for more information.

The package includes several additional vignettes, which can be viewed with `browseVignettes(package = "netrankr")` or [online](http://schochastics.github.io/netrankr)
