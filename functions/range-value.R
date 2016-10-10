range_value <- function(x, na.rm = T){
	if(na.rm){
		x <- na.omit(x)
	}
	max(x) - min(x)
}