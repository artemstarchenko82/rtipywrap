#' Методы для работы с классом tinkoff.invest.schemas.MoneyValue

#' MoneyValue as.double
#' 
#' @export
as.double.tinkoff.invest.schemas.MoneyValue <- function(x){
    paste(x$units, abs(x$nano), sep = ".") |> 
        as.numeric()
}


#' Print MoneyValue
#' 
#' @export
print.tinkoff.invest.schemas.MoneyValue <- function(x){
    print(paste(as.double(x), x$currency))
}


#' Format MoneyValue
#' 
#' @export
format.tinkoff.invest.schemas.MoneyValue <- function(x){
    format(paste(as.double(x), x$currency))
}
