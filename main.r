#!/usr/bin/env Rscript

float_equal <- function(x, y, err = 1e-6) {
    abs(x - y) < err
}

## stopifnot

## Assert

    # http://stackoverflow.com/questions/2233584/does-r-have-an-assert-statement-as-in-python

    stopifnot(TRUE)

## Suppress output of commands:

    # http://stackoverflow.com/questions/2723034/suppress-one-commands-output

## Functions

    f <- function() {
        1
    }
    stopifnot(f() == 1)

## Assignment

## =

## <-

    # Use `<-` always: http://stackoverflow.com/questions/1741820/assignment-operators-in-r-and

    a <- 1
    stopifnot(a == 1)

## Vectors

## Lists

## Arrays

    # "Vectors" are lists of any type of data.

    ## Create vectors

        ## c

            # Stands for "concatenate".

            v <- c(1, 2, 3)

        ## :

            stopifnot(all(1:3 == c(1, 2, 3)))

        ## rep

            stopifnot(all(rep(1, times = 3) == c(1, 1, 1)))

    ## Indexing

    ## []

        # One based, like all newb languages!

        v <- c(1, 4, 9)
        stopifnot(v[1] == 1)
        stopifnot(v[2] == 4)
        stopifnot(v[3] == 9)

    ## length

        stopifnot(length(1:4) == 4)

## all

    # All values are true.

    stopifnot(all(c(TRUE, TRUE)))
    stopifnot(!all(c(TRUE, FALSE)))

    # Application: check if vectors are equal:

    stopifnot(all(c(1, 2) == c(1, 2)))

## IO

    print('hello')

## cor

    # Pearson correlation:
    # https://en.wikipedia.org/wiki/Pearson_product-moment_correlation_coefficient

    stopifnot(cor(c(1, 2, 3), c(2, 4, 6), method='pearson') == 1)
    stopifnot(float_equal(cor(c(1, 2, 3), c(-2, -4, -6), method='pearson'), -1)
