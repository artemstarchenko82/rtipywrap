# Функции для работы с классом 'tinkoff.invest.schemas.Quotation'

#' Перевеод в число объекта Quotation
#' 
#' @description Переводим объект класса [Quotation](https://tinkoff.github.io/investAPI/operations/#quotation)
#' в [base::double()]
#' 
#' @param x объект класса 'tinkoff.invest.schemas.Quotation'
#' 
#' @export
as.double.tinkoff.invest.schemas.Quotation <- function(x){
    paste(x$units, abs(x$nano), sep = ".") |> 
        as.double()
}


#' Перевеод в строку объекта Quotation
#' 
#' @description Переводим объект класса [Quotation](https://tinkoff.github.io/investAPI/operations/#quotation)
#' в [base::character()]
#' 
#' @param x объект класса 'tinkoff.invest.schemas.Quotation'
#' 
#' @export
as.character.tinkoff.invest.schemas.Quotation <- function(x){
    as.character(as.double(x))
}


#' Печать объекта Quotation
#' 
#' @description Выводим на печать объект класса [Quotation](https://tinkoff.github.io/investAPI/operations/#quotation)
#' 
#' @param x объект класса 'tinkoff.invest.schemas.Quotation'
#' 
#' @export
print.tinkoff.invest.schemas.Quotation <- function(x){
    cat(as.character(x))
}
