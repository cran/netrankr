context("approximate probabilistic centrality")
library(igraph)
library(magrittr)
library(Matrix)

test_that("approximate expected is correct", {
    P <- matrix(c(0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, rep(0, 10)), 5, 5, byrow = TRUE)
    methods_str <- c("lpom", "glpom", "loof1", "loof2")
    res <- round(sapply(methods_str, function(x) approx_rank_expected(P, method = x)), 3)
    lpom <- c(1.2, 2.0, 3.0, 4.5, 4.5)
    glpom <- c(1.250, 2.167, 2.833, 4.333, 4.417)
    loof1 <- c(1.333, 2.143, 2.917, 4.250, 4.357)
    loof2 <- c(1.340, 2.204, 2.910, 4.198, 4.349)


    expect_equal(res[, 1], lpom)
    expect_equal(res[, 2], glpom)
    expect_equal(res[, 3], loof1)
    expect_equal(res[, 4], loof2)

    expect_error(approx_rank_expected(1))
    expect_error(approx_rank_expected(matrix(c(0, 2, 2, 0), 2, 2)))
})

test_that("approximate relative is correct", {
    P <- matrix(c(0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, rep(0, 10)), 5, 5, byrow = TRUE)
    rel_noiter <- approx_rank_relative(P, iterative = FALSE)
    rel_iter1 <- approx_rank_relative(P, iterative = TRUE, num.iter = 1)

    expect_equal(rel_noiter, rel_iter1)

    P <- matrix(1, 10, 10)
    rownames(P) <- colnames(P) <- paste0("V", 1:10)
    P[lower.tri(P, diag = T)] <- 0
    rel_iter10 <- approx_rank_relative(P, iterative = TRUE, num.iter = 10)
    rownames(rel_iter10) <- colnames(rel_iter10) <- paste0("V", 1:10)
    rel_mcmc <- mcmc_rank_prob(P, rp = 100)$relative.rank
    expect_equal(P, rel_iter10)
    expect_equal(P, rel_mcmc)

    P <- matrix(1, 5, 5) - diag(1, 5)
    expect_error(approx_rank_expected(P))
    expect_error(approx_rank_relative(P))

    P <- matrix(1, 10, 10)
    P[lower.tri(P, diag = T)] <- 0
    rel_iter10 <- approx_rank_relative(P, iterative = TRUE, num.iter = 10)
    rel_mcmc <- mcmc_rank_prob(P, rp = 100)$relative.rank
    rownames(rel_mcmc) <- colnames(rel_mcmc) <- NULL

    expect_equal(P, rel_iter10)
    expect_true(all(P == rel_mcmc))
})

test_that("mcmc error andling works", {
    expect_error(mcmc_rank_prob("a"))
})
