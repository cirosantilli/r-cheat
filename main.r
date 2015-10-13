#!/usr/bin/env Rscript

## Helpers

    float_equal <- function(x, y, err = 1e-6) {
        abs(x - y) < err
    }

## stopifnot

## Assert

    # http://stackoverflow.com/questions/2233584/does-r-have-an-assert-statement-as-in-python

    # All arguments must be TRUE: stricter than `if` conditions which treat `1` as truthy.

    stopifnot(TRUE)

    # Vectors are accepted, and all elements must be TRUE:

    stopifnot(c(TRUE, TRUE))

    # Docs say:

    # stopifnot(A, B) is conceptually equivalent to:

    # {   if(any(is.na(A)) || !all(A)) stop(...) ;
    #       if(any(is.na(B)) || !all(B)) stop(...) }

## help

## ?

    # Get help:

    #help(stopifnot)
    #help(write.table)

    # Also available through the shortcut syntax:

    #?stopifnot
    #?write.table

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

## if

## else

    pass <- FALSE
    if (TRUE) {
        pass <- TRUE
    } else {
        stopifnot(FALSE)
    }
    stopifnot(pass)

    stopifnot(!!1)
    stopifnot(!!-1)
    stopifnot(!0)

    # For vectors, only the first element is considered,
    # and a warning is raised.

    #if (c(FALSE, TRUE)) { stopifnot(FALSE) }

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

        ## seq

            # Like : but more versatile.

            # Custom step:

                stopifnot(all(seq(1, 5, 2) == c(1, 3, 5)))

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

## matrix

    ## Basic

        A <- matrix(
            1:6,
            nrow = 2,
            ncol = 3
        )

        # Filled by row first by default.

        stopifnot(A[1, 1] == 1)
        stopifnot(A[2, 1] == 2)
        stopifnot(A[1, 2] == 3)
        stopifnot(A[2, 2] == 4)
        stopifnot(A[1, 3] == 5)
        stopifnot(A[2, 3] == 6)

        # Linear access.

        stopifnot(A[1] == 1)
        stopifnot(A[2] == 2)
        stopifnot(A[3] == 3)

    ## nrow

    ## ncol

        # One size parameter can be omitted:

        stopifnot(all(
            matrix(1:6, ncol = 3)
            ==
            matrix(1:6, nrow = 2, ncol = 3)
        ))

        # If both are omitted, we get a 1D matrix, which is a vector:

        stopifnot(all(
            matrix(1:6) == 1:6
        ))

    ## byrow

        # Fill rows first.

        A <- matrix(1:6, nrow = 2, byrow = TRUE)
        stopifnot(A[1, 1] == 1)
        stopifnot(A[1, 2] == 2)
        stopifnot(A[1, 3] == 3)
        stopifnot(A[2, 1] == 4)
        stopifnot(A[2, 2] == 5)
        stopifnot(A[2, 3] == 6)

    ## Slicing

        A <- matrix(1:6, nrow = 2)

        stopifnot(all(A[, 1] == c(1, 2)))
        stopifnot(all(A[, 2] == c(3, 4)))

        stopifnot(all(A[1,] == c(1, 3, 5)))
        stopifnot(all(A[2,] == c(2, 4, 6)))

        stopifnot(all(A[, c(1,3)] == cbind(c(1, 2), c(5, 6))))

        stopifnot(all(A[, 1:3] == A))

    ## cbind

        # Join two vectors as columns.

        stopifnot(all(
            cbind(c(1, 2, 3), c(4, 5, 6))
            ==
            matrix(1:6, ncol = 2)
        ))

    ## rbind

        # Join two vectors as rows.

        stopifnot(all(
            rbind(c(1, 2, 3), c(4, 5, 6))
            ==
            matrix(1:6, nrow = 2, byrow = TRUE)
        ))

## all

    # All values are true.

    stopifnot(all(c(TRUE, TRUE)))
    stopifnot(!all(c(TRUE, FALSE)))

    # Application: check if vectors are equal:

    stopifnot(all(c(1, 2) == c(1, 2)))

## String

    stopifnot('abc' == 'abc')
    stopifnot('abc' != 'a0c')

    ## paste

        stopifnot(paste('ab', 'cd') == 'ab cd')
        stopifnot(paste('ab', 'cd', sep = '') == 'abcd')

## cor

    # Pearson correlation:
    # https://en.wikipedia.org/wiki/Pearson_product-moment_correlation_coefficient

    stopifnot(cor(c(1, 2, 3), c(2, 4, 6), method='pearson') == 1)
    stopifnot(float_equal(cor(c(1, 2, 3), -c(2, 4, 6), method='pearson'), -1))

    # Matrix version: outputs ncols X ncols covariance matrix (symmetric) between all columns.

    stopifnot(all(
        cor(cbind(c(1, 2, 3), c(2, 4, 6)), method='pearson')
        ==
        matrix(rep(1, 4), nrow = 2)
    ))

    stopifnot(all(
        cor(cbind(c(1, 2, 3), -c(2, 4, 6)), method='pearson')
        ==
        cbind(c(1, -1), c(-1, 1))
    ))

## IO

    print('hello')

    ## write.table

    ## read.table

        A <- matrix(1:6, nrow = 2)
        write.table(A, 'write-table.tmp')
        stopifnot(all(read.table('write-table.tmp') == A))

        # Format:

        #"V1" "V2" "V3"
        #"1" 1 3 5
        #"2" 2 4 6

        write.table(A, 'bare.tmp', row.names = FALSE, col.names = FALSE)
        stopifnot(all(read.table('bare.tmp') == A))

        # Format:

        #1 3 5
        #2 4 6

        # Read also works for such bare data.

        ## Big files

            # read.table is slow:
            # http://stackoverflow.com/questions/1727772/quickly-reading-very-large-tables-as-dataframes-in-r

        ## Only read some columns

            # TODO

            # http://stackoverflow.com/questions/5788117/only-read-limited-number-of-columns-in-r
