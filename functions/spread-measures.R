spread_measures <- function(x){
	c('Range' = max(x) - min(x), 'IQR' = IQR(x), 'Standard Deviation' = sd(x))
}