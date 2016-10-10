library(testthat)

x <- c(1,2,3,4,5)
y <- c(1,2,3,4,NA)
z <- c(T,F,T)
w <- letters[1:5]

source('../functions/range-value.R')

context("Test for range value")

test_that("range works as expected", {
	expect_equal(range_value(x), 4)
	expect_length(range_value(x), 1)
	expect_type(range_value(x), 'double')
	})

test_that("range works as expected", {
	expect_length(range_value(y), 1)
	expect_equal(range_value(y), 3)
	})

test_that("range works as expected", {
	expect_length(range_value(y), 1)
	expect_equal(range_value(y, na.rm = F), NA_real_)
	})

test_that("range works as expected", {
	expect_type(range_value(z), 'integer')
	expect_equal(range_value(z), 1)
	expect_length(range_value(z), 1)
	})

test_that("range works as expected", {
	expect_error(range_value(w), 
		'non-numeric argument to binary operator')
	})

##################
# missing_value()
##################

source('../functions/missing-values.R')

context("Test for missing value")

test_that("missing values are found properly", {
	expect_length(missing_values(x), 1)
	expect_gte(missing_values(x), 0)
	expect_type(missing_values(x), 'integer') #it returns an integer
	})

test_that("missing values are found properly", {
	expect_length(missing_values(y), 1)
	expect_gte(missing_values(y), 0)
	expect_type(missing_values(y), 'integer') #it returns an integer
	expect_equal(missing_values(y), 1)
	})

##################
# center_measures()
##################

source('../functions/center-measures.R')

context("Look at measures of center, such as median and mean")

test_that("Measures of center are correct", {
	expect_length(center_measures(x), 2)
	expect_type(center_measures(x), 'double')
	expect_equal(center_measures(x), c('median' = 3, 'mean' = 3))
	})

##################
# spread_measures()
##################

source('../functions/spread-measures.R')

context("Look at measures of spread, such as range, IQR, and standard deviation")

test_that("Measures of spread are correct", {
	expect_length(spread_measures(x), 3)
	expect_type(spread_measures(x), 'double')
	expect_equal(spread_measures(x), c('Range' = 4, 'IQR' = 2, 'Standard Deviation' = sqrt(2.5)))
	})
